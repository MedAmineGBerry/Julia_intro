#=In order to avoid unnecessarily copying large
 amounts of data, Julia by default copies only the
  memory address of large objects, unless the programmer 
  explicitly request a so-called "deep" copy. =#

a=b
  #="simple" types (e.g. Float64, Int64, but also String) are deep copied
  containers of simple types (or other containers) are shadow copied 
  (their internal is only referenced, not copied)=#
copy(x)
#simple types are deep copied
#containers of simple types are deep copied
#=containers of containers: the content is shadow copied 
(the content of the content is only referenced, not copied)=#
deepcopy(x)
#Everything is deepcopied recursively

# == for equality
# === to see if two objects are same
 #= given a = [1, 2]; b = [1, 2];, a == b and a === a are true, but a === b is false;
  given a = (1, 2); b = (1, 2);,  all a == b, a === a anda === bare true.=#

rand() #random from 0 to 1 
rand(a:b) #random number in a and b 
rand(a:0.01:b) #random with a precision to second digit

using Pkg; Pkg.add("Distributions")
import Distributions: Uniform 
rand(Uniform()) #with more pecision
rand(Uniform(a,b),2,3) #2x3 matrix

#=nothing (type Nothing): is the value returned by code blocks
 and functions which do not return anything.
 It is a single instance of the singleton type Nothing, 
and the closer to C style NULL (sometimes it is referred as to the "software engineer’s null").
Most operations with nothing values will result in a run-type error.
In some contexts it is printed as #NULL;

missing (type Missing): represents a missing value in a statistical sense:
there should be a value but we don't know which is (so it is sometimes
referred to as the "data scientist’s null"). Most operations with missing values
will result in missing propagate (silently). Containers can handle missing values
efficiently when declared of type Union{T,Missing}. The Missing.jl package provides
additional methods to handle missing elements;

NaN (type Float64):  represents when an operation results in a Not-a-Number
value (e.g. 0/0). It is similar to missing in the fact that it propagates silently.
Similarly, Julia also offers Inf (e.g. 1/0) and -Inf (e.g. -1/0).