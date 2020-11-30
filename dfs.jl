
show(widedata, allcols=true)
[eltype(col) for col = eachcol(widedata)]
first(data,6)
show(data, allrows=true, allcols=true)
last(data, 6)
describe(data)
unique(data.type_interaction)
names(data)
[eltype(col) for col = eachcol(data)]
size(data)
size(data)[1] #rows
size(data)[2]  #colums
ENV["LINES"] = 60 #when to truncate if big dataframe
for c in eachcol(data) #iterate over col
for r in eachrow(data) #iterate over rows


push!(df, [1 2 3]) #append row
select!(data, Not([:col1, :col2])) #delete columns
names!(df, [:c1,:c2,:c3]) #rename allcol
rename!(df, Dict(:c1 => :newCol)) #rename selection
df = df[:,[:b, :a]] #change order
df = vcat(df1,df2,df3) or df = vcat([df1,df2,df3]...) #concat
fullDf = join(df1, df2, on = :commonCol) #horizontal join

#cumulative
df = DataFrame(region=["US","US","US","US","EU","EU","EU","EU"],
             year = [2010,2011,2012,2013,2010,2011,2012,2013],
             value=[3,3,2,2,2,2,1,1])
df.cumValue = copy(df.value)
[r.cumValue = df[(df.region .== r.region) .& (df.year .== (r.year-1)),:cumValue][1] + r.value  for r in eachrow(df) if r.year != minimum(df.year)]

import Pkg; Pkg.add("DataFramesMeta")
using DataFramesMeta, DataFrames
df = DataFrame(region  = ["US","US","US","US","EU","EU","EU","EU"],
             product = ["apple","apple","banana","banana","apple","apple","banana","banana"],
             year    = [2010,2011,2010,2011,2010,2011,2010,2011],
             value   = [3,3,2,2,2,2,1,1])
df.cumValue = 0.0
for subdf in groupby(df,[:region,:product])
  subdf.cumValue .= cumsum(subdf.value)
end

#pivot
df = DataFrame(region = ["US","US","US","US","EU","EU","EU","EU"],
               product = ["apple","apple","banana","banana","apple","apple","banana","banana"],
               year = [2010,2011,2010,2011,2010,2011,2010,2011],
               produced = [3.3,3.2,2.3,2.1,2.7,2.8,1.5,1.3],
               consumed = [4.3,7.4,2.5,9.8,3.2,4.3,6.5,3.0])
long1 = stack(df,[:produced,:consumed])
long2 = melt(df,[:region,:product,:year])
long3 = stack(df)
long1 == long2 == long3 # true


#aggregate
by(data, [:id_content,:type_interaction], nrow)

#widen

