import Pkg; Pkg.add("LibPQ")
import LibPQ
using DataFrames
using Dates

function connect()
    conn = LibPQ.Connection("""host = xxxxxx
                port = 5439 user='amine'
                password='xxxxxxxx'
                sslmode = 'require'
                dbname =warehouse""";
                options=Dict{String, String}())
    conn
end

function get_data(start_date, end_date, country, city )
    conn = connect()
    prepare_sql = """select dc.id_content, di.type_interaction, dc.created, count(*) as n 
    from
    fact_product fp, dim_content dc, dim_city dci, dim_country dco, dim_interaction di, dim_location dl
    where 
    di.type_interaction in ('action.post.voteup', 'action.post.votedown','action.post.pin') and
    ts >= \$1 and ts < \$2 and  dco.country_code = \$3 and dci.city_name = \$4 and dc.country_code = \$3 
    and  dc.city_name  = \$4 and dc.blocked = False and 
    fp.fk_content = dc.sk_content and 
    fp.fk_interaction = di.sk_interaction and
    fp.fk_location = dl.sk_location and 
    dl.fk_country = dco.sk_country and 
    dl.fk_city = dci.sk_city
    group by dc.id_content, di.type_interaction, dc.created"""
    stmt = LibPQ.prepare(conn, prepare_sql)
    res = LibPQ.execute(stmt, [start_date,end_date,country,city])
    result = DataFrame(res)
    close(conn)
    result
end

function treat_data(data)
    widedata = unstack(data, :type_interaction, :n)
    idx=size((widedata))[2]
    widedata[3:idx]
    for col in names(widedata[3:idx])
        widedata[ismissing.(widedata[:,col]), col] .= 0
    end
    names!(widedata, [:id_content,:created,:pin, :votedown, :voteup])
    widedata
end
    
function create_rankings(widedata, ranking)
    if ranking == "jodel"
        widedata.ranking = widedata.voteup .-  widedata.votedown
    elseif ranking == "amazon"
        widedata.ranking = widedata.voteup ./ (widedata.votedown)
    elseif ranking == "hotsorting"
        widedata.recency = (today .- widedata.created) ./ 1000
        widedata.recency = Dates.value.(widedata.recency) ./ 60
        widedata.ranking = (9 .* widedata.pin .+ widedata.voteup .- widedata.votedown) ./ (widedata.recency .* 1)
    else
        println("Please enter a valid ranking")
    end
    widedata = filter(:ranking => x -> !any(f -> f(x), (ismissing, isnothing, isnan,isinf)), widedata)
    sort!(widedata, [:ranking],rev=true)
    widedata
end

today = DateTime(2020,11,03)
start_date = "2020-11-01";
end_date = "2020-11-02";
country = "DE";
city = "Berlin";

@time data = get_data(start_date, end_date, country, city )
@time widedata = treat_data(data)

ranking = "hotsorting"
@time ranked_data = create_rankings(widedata, ranking) 

