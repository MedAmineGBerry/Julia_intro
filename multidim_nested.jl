a = [[1,2] [5,3] [4,6]] #Create a matrix  [[elements of the first column] [elements of the second column] ...] 
a = [1 4; 2 5; 3 6] #Create a matrix  [[elements of the first row] [elements of the second row] ...] 
hcat(1,2) #concat different columns
vcat(1,2) #concat different rows
a = [[1,2,3],[4,5,6]] #one column
a = [[1,2,3] [4,5,6]] #two columns
m = Array{Float64}(undef, 0, 0) #empty  float mawtrcies
m = Array{T}(undef, a, b, ...,z) #More general
a = [[1,2] [5,3] [4,6]] # 2 rows , 3 columsn (2x3)
a = zeros(2,3) # 2 rows , 3 columsn (2x3) of zeros
a = fill("abc",2,3) # 2 rows , 3 columsn (2x3) od abc
a[2][3] # for nnested array access
a[row,col] # to access a specific value
a[1:2,:] # slicing
a = [[1,2,3] [4,5,6]]
mask = [[true,true,false] [false,true,false]] #select specific values with the mask
a[mask]
size(a)
ndims(a)
reshape(a, 1, 6) # one row of 6 values
a = [3x + 2y + z for x in 1:2, y in 2:3, z in 1:2] # Example of use