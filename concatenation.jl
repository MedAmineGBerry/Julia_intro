#Conncatenation######################################
x*y #"amineandrea"
x*z #error (doesn t cast)
string(x,y) #"amineandrea"
string(x,z) #"amine1" 
a = "$x is a string and $z is an integer"
join([x,y],"+") #"amine+andrea"

replace(x, "a" => "b") #"bmine"
s ="  this has trailing whitespaces     "
strip(s) #"this has trailing whitespaces" (remove leading and trailing whitespaces) 
