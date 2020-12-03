#normal for loop, while, do, if then
for i=1:2,j=2:4
    println(i*j)
end

#break and continue also work

#maps and list comprehesension
[println(i) for i in [1,2,3]]

[x + 2y for x in [10,20,30], y in [1,2,3]]

mydict = Dict(); [mydict[i]=value  for (i, value) in enumerate(mylist)]

[students[name] = gender for (name,gender) in zip(names,genders)] #zip returns an iterator of tuples pairing two or multiple lists, e.g. [("Marc","M"),("Anne","F")] 
map((n,s) -> students[n] = s, names, genders  # map applies a function to a list of argument

# a = map(f, [1,2,3]) is equal to  a = map(x->f(x), [1,2,3])

#=Ternary operator is supported as a ? b : c (if a is true, then b, else c).
Put attenction to wrap the ? and : operators with space. =#


# && for and
# || for or 
# ! for not
#Do block
smallprimes = [1,2,3,5,7,11,13,17,19,23];
findall(x -> isequal(13, x), smallprimes) #position element number that is equal to 13 
findall(smallprimes) do x #same but helps with longer functions
    isequal(x, 13) 
 end

