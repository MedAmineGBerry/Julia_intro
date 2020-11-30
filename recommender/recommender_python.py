import os
import pandas as pd
from datetime import datetime
import utilities.connect_to_dwh as connect_to_dwh
import boto3
import datetime as dt
import numpy as np

os.environ["PSQL_HOSTNAME"] = "172.31.27.255"
os.environ["PSQL_DATABASE"] = "warehouse"
os.environ["PSQL_PORT"] = "5439"
os.environ["PSQL_USER"] = "amine"
os.environ["PSQL_PASS"] = "7V1tk<Cbx;Bd^PS5;*fD"

connection = connect_to_dwh.PSQL()

def get_data(var_date_start, var_date_end, var_country, var_city):

    """
    This function goal is to get the content and interactions
    """
    con = connection.connect()
    query = '''select dc.id_content, di.type_interaction, dc.created, count(*) as n 
    from
    fact_product fp, dim_content dc, dim_city dci, dim_country dco, dim_interaction di, dim_location dl
    where 
    di.type_interaction in ('action.post.voteup', 'action.post.votedown','action.post.pin') and
    ts >= '{var_date_start}' and ts < '{var_date_end}' 
    and  dco.country_code = '{var_country}' 
    and dci.city_name = '{var_city}' and dc.country_code = '{var_country}' 
    and  dc.city_name  = '{var_city}' and dc.blocked = False and 
    fp.fk_content = dc.sk_content and 
    fp.fk_interaction = di.sk_interaction and
    fp.fk_location = dl.sk_location and 
    dl.fk_country = dco.sk_country and 
    dl.fk_city = dci.sk_city
    group by dc.id_content, di.type_interaction, dc.created'''.format(
                   var_date_start=var_date_start,
                   var_date_end=var_date_end,
                   var_country=var_country,
                   var_city=var_city)
    data = pd.read_sql(query, con)
    con.close()
    return data

def treat_data(data):
    widedata = data.pivot(
        index='id_content',
        columns='type_interaction',
        values='n')
    widedata = widedata.fillna(0)
    widedata.columns = ['pin', 'votedown', 'voteup']
    widedata.index.name = 'id_content'
    widedata = widedata.reset_index(inplace=False)
    widedata = widedata.join(data.created)
    return widedata

def create_rankings(widedata, ranking):
    if ranking == "jodel":
        print("Jodel Ranking...")
        widedata['ranking'] = widedata['voteup'] -  widedata['votedown']
    elif ranking == "amazon":
        print("Amazon Ranking...")
        widedata['ranking'] = widedata['voteup'] / widedata['votedown']
    elif ranking == "hotsorting":
        print("Hotsorting Ranking...")
        widedata['recency'] = (today - widedata['created']).dt.total_seconds()
        widedata['ranking'] = (9 * widedata['pin'] + widedata['voteup']  - widedata['votedown']) / (widedata['recency'] * 1)
    else:
        print("Please enter a valid ranking")
    widedata = widedata[~widedata.isin([np.nan, np.inf, -np.inf]).any(1)]
    widedata = widedata.sort_values(by=['ranking'], ascending=False)
    return widedata

today = datetime(2020,11,3)
start_date = '2020-11-01'
end_date = '2020-11-02'
country = 'DE'
city = 'Berlin'

data = get_data(start_date, end_date, country, city )
widedata = treat_data(data)
ranking ='jodel'
ranked_data = create_rankings(widedata,ranking)




