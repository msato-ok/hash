class MyHashFunction
  # 古典的なハッシュ関数、One-at-a-Time Hash
  # 参考：http://www.burtleburtle.net/bob/hash/doobs.html
  def one_at_a_time(key) #keyは文字列を想定
    hash = 0
    key.each_char {|ch| #文字を取り出す
      hash += ch.ord
      hash += (hash << 10)
      hash ^= (hash >> 6)
    }
    hash += (hash << 3)
    hash ^= (hash >> 11)
    hash += (hash << 15)
    hash %= (2**30)
    # 0 <= hash < 2**30 の範囲で扱えるような数値に補正
    # FixNum クラスの数値範囲による
  end
end
