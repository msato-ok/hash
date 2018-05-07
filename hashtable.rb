require './hash_function'
require './tablesize'

# ハッシュ関数を用いた連想配列（ハッシュテーブル）の実装

class MyHashTable
  def initialize()
    @arr = Array(TABLESIZE)
  end
  # keyは文字列を想定
  def []= (k, v)
    offset = hash_function(k) % TABLESIZE

    if @arr[offset].nil? then
      @arr[offset] = Array.new().push([k, v])
    else
      found = false
      @arr[offset].each {|e|
        if(e[0] == k)
          found = true
          e[1] = v
          break
        end
      }
      if not found
        @arr[offset].push([k, v])
      end
    end
  end

  def [] (k)
    hash_value = hash_function(k)
    offset = hash_value % TABLESIZE
    print("Query: ", k, "\n")
    print("Hash Value: ", hash_value.to_s(16), "\n")
    print("Offset: ", offset, "\n")

    value = nil
    if @arr[offset].nil?
      puts("not found")
    else
      found = false
      @arr[offset].each {|e|
        if e[0] == k
          found = true
          print("found: ", e[1], "\n")
          value = e[1]
        end
      }
      if not found
        puts("not found")
      end
    end
    puts()
    value
  end

  def hash_function(k)
    MyHashFunction.new.one_at_a_time(k)
  end
end
