# it;s randomly ordered
mydict = Dict() # empty dictionnary
mydict = Dict('a'=>1, 'b'=>2, 'c'=>3) #dictionnary with values
mydict['d'] = 4 #adding value
mydict['a'] # accessing value
keys(mydict) #get all keys
values(mydict) # get values
haskey(mydict, 'a') #check if value exists
n(('a' => 1), mydict) #check if a pair exists
for (k,v) in mydict #iterate
    println("$k is $v") #through
 end #the keys
# Dictionaries are mutable

 # Dictionaries are type unstable if different type of values are stored,
 # while NamedTuples remain type-stable:
d = Dict(:k1=>"v1", :k2=>2)  # Dict{Symbol,Any} 
nt = (k1="v1", k2=2,) # NamedTuple{(:k1, :k2),Tuple{String,Int64}}

#nametuples are more effective 