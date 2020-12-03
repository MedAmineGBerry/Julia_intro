#immutable
a = (1,2,3) # this is a tuple
a = 1,2,3 # or this

var1, var2 = (a,b) # we we want more than an output in na funcntion. tuples are a good idea for that
a=(1,2,3); v = [a...] # connvert a tuple to a vector
v = [i[1] for i in a] # this also convnerets it 
v=collect(a)  # this too
a = (v...,) # array to tuple