class HashMap
  def initialize
    @buckets = Array.new(16)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    hash = hash(key) % 16
    if @buckets[hash].nil?
    @buckets[hash] = [key, value]
    p @buckets
    else
      @buckets[hash][1] = value
      p @buckets
    end
  end
end

map = HashMap.new
map.set("ali", "akeel")
map.set("ali", "ahmed")
