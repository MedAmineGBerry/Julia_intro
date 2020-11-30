const x = 5 #means it doesn t change type but can change value not like C (it also must be global)

convertedObj = convert(T,x) #to convert types (error risen when not possible is InexactError)
myInt = parse(Int,"ab") #convet strings to float or int
myString = string(123) #convert int to string
myNewList = parse.(Float64,["1.1","1.2"]) #Broadvcast to work on scalar

readdlm() #read delimited file into a matrix
myData = convert(Array{Float64,2},readdlm(myinputfile,'\t')[2:end,4:end]); # skip the first 1 row and the first 3 columns
