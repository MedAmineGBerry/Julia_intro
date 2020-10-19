using Random
#Arrays (lists)#################################
a = []
a = Int64[] #another way
a = Array{Float64,1}() #another way
c = Vector{String}(); #Another way

#zeros and ones
a = zeros(5)
a = zeros(Float64,5)
a = ones(Float64,5)

a = [1;2;3] #column vector
a = [1,2,3] #another way

a = [1 2 3]  #row vector

x = [10, "foo", false] #can be mixed but will have the type Any (SLOWER)
#= 3-element Array{Any,1}:
    10
      "foo"
 false =#

a = Union{Int64,String,Bool}[10, "Foo", false] #solution is to specify the types and have a faster implementation
#=3-element Array{Union{Bool, Int64, String},1}:
    10
      "Foo"
 false =#

#=Attention that a = Array{Int64,1} (without the round brackets) 
doesn't create an Array at all, but just assign the "DataType" Array{Int64,1} to a.
You can also declare an array of size n (with garbage content) with a=Array{T,1}(undef,n) =#
a = Array{Int64,1} #Array{Int64,1}
a = Array{Int64,1}() #Int64[]
a=Array{Int64,1}(undef,5)
#=5-element Array{Int64,1}:
          0
          1
 4507725056
          1
          1=#
a[1] #number 1 
a[1:4] # from 1 to 4  inclusive
a[1:2:4] # from 1 to 4 with a jump of 2 (will show us  and 3 here)
a[begin:1:5] #begin to state that it should start from the beginning of the array
a[3:1:end] #end to state that it go till the  end with jump no jump and start from 3

y=[2015; 2025:2030; 2100] #create 215 themn 2025 2-26 etc (SEMI COLONS here)
y=vcat(2015, 2025:2030, 2100) #another way

#useful functions
a=Array{Int64,1}(undef,5)
b=Array{Int64,1}(undef,5)
push!(a,5) # add an element at the end
append!(a,b) #two arrays 
c = vcat(1,a,b) #concat multiple
pop!(a)  #pop last element
popfirst!(a) # firstelement
deleteat!(a,3) # delete a value at a specific position
b = 5 
pushfirst!(a,b) #push one element at the start of the array
sort!(a) #sort ascendin
sort(a) #sort ascendin without modifying the original element
a[end:-1:1] # reversing an array
in(1, a) #check the existence in the array returns boolean
length(a) # length of a 
maximum(a) #or
max(a...)
minimum(a) #or
min(a...)
empty!(a)
b = vec(a)
using Random
shuffle(a)
isempty(a) #check if empty
findall(x -> x == value, a)  #fund the index of a value
deleteat!(a, findall(x -> x == 4294967297, a)) #delete a specific row by value