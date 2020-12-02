# this is a single line comment

#= this is 
a multi
line comment =#

x=1 
println(x) # this works

#println (x) # this doesn t 

import Plots: pyplot, plot
pyplot()
plot(rand(4,4))

import Plots
const pl = Plots # this create an an alias, equivalent to Python "import Plots as pl". Declaring it constant may improve the performance.
pl.pyplot()
pl.plot(rand(4,4))




