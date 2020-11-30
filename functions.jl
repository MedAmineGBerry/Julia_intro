f(x,y) = 2x+y # this is a function
function f(x) #this is also a function
    x+2
  end

myfunction(a,b=1;c=2) = (a+b)*3 # definition with 2 position arguments and one keyword argument  
myfunction(10,c=13) # calling (10+1)*3

function f(par::Union{Float64, Vector{Float64}} = Float64[]) [...] end #can also specify the type

values = [1,2,3]
function average(init, args...) #The parameter that uses the ellipsis must be the last one
  s = 0
  for arg in args 
    s += arg 
    println(s)
  end
  return init + s/length(args)
end
a = average(10,1,2,3)        # 12.0
a = average(10, values ...)  # 12.0

#Return is optional
myfunction(a,b) = a*2,b+2
x,y = myfunction(1,2)

#Multiple-dispatch (aka polymorphism)

#Templates (type parametrisation)
myfunction(x::T, y::T2, z::T2) where {T <: Number, T2} = 5x + 5y + 5z

f(x) = 2x # define a function f inline
a = f(2)  # call f and assign the return value to a
a = f     # bind f to a new variable name (it's not a deep copy)
a(5)      # call again the (same) function

#Anonymous functions
x -> x^2 + 2x - 1

#Broadcast
#You can "broadcast" a function to work over each elements of an array (singleton): 
myArray = broadcast(i -> replace(i, "x" => "y"), myArray)
#equivalent to
myArray = replace.(myArray, Ref("x" => "y"))
#= While in the past broadcast was available on a limited number of core functions only, the f.() syntax is 
now automatically available for any function, including the ones you define. =#