#write
open("afile.txt", "w") do f  # "w" for writing
    write(f, "test\n")         # \n for newline
end

#read
open("afile.txt", "r") do f   # "r" for reading
    filecontent = read(f,String) # attention that it can be used only once. The second time, without reopening the file, read() would return an empty string
    print(filecontent)
end

#Read line by line
open("afile.txt", "r") do f
    for ln in eachline(f)
      println(ln)
    end
end

#print the line number

open("afile.txt", "r") do f
    for (i,ln) in enumerate(eachline(f))
      println("$i $ln")
    end
end
