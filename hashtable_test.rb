require "./hashtable"

arr = MyHashTable.new()

arr["altus"] = 5
arr["altus"] #=> 5

arr["altus"] = 50
arr["altus"] #=> 50

arr["alt"] #=> nil
