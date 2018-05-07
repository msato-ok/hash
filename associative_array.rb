# 配列を連想配列化する（強引な）実装

class MyAssociativeArray < Array
  def []= (k, v)
    found = false
    self.each {|item|
      if item[0] == k then
        item[1] = v
        found = true
        break
      end
    }
    if not found then
      self.push([k, v])
    end
  end

  def [] (query)
    found = false
    value = nil
    self.each {|item| #線形走査
      if item[0] == query then
        found = true
        value = item[1]
        break
      end
    }
    value
  end
end
