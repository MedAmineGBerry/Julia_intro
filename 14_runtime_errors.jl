try
    # ..some dangerous code..
  catch
    # ..what to do if an error happens, most likely send an error message using:
    error("My detailed message")
end

#specific exceptions
function volume(region, year) 
    try
        return data["volume",region,year]
    catch  e
        if isa(e, KeyError)
          return missing
        end
        rethrow(e)
    end
end
