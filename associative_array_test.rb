require "./associative_array"

arr = MyAssociativeArray.new()

arr["altus"] = 5
p(arr["altus"]) #=> 5

arr["altus"] = 50
p(arr["altus"]) #=> 50
p(arr["alt"]) #=> nil