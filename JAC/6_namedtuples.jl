aNamedTuple = (a=1, b=2) #create a named Tuple
aNamedTuple.a #access value in the namedtuple by name
aNamedTuple[1] #access value in the namedtuple by position
keys(aNamedTuple) # get a tuple of the keys
values(aNamedTuple) #geta tuple of the values
collect(aNamedTuple) #get an array of the values
pairs(aNamedTuple) # get an iterable of the pairs (k,v)
for (k,v) in pairs(aNamedTuple) [...] end #example

#can hold any value but are immutable (was inn a separate package before julia 1.0)