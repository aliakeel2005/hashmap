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
      raise IndexError if hash.negative? || hash >= @buckets.length

      @buckets[hash] = [key, value]
    else
      @buckets[hash][1] = value
    end
    p @buckets
  end

  def get(key)
    @buckets.each do |elem|
      return elem[1] if elem.is_a?(Array) && elem[0] == key

      return nil
    end
  end

  def has?(key)
    @buckets.each do |elem|
      return true if elem.is_a?(Array) && elem[0] == key

      return false
    end
  end
end

map = HashMap.new
map.set('ali', 'akeel')
map.set('ali', 'ahmed')
p map.has?('jasim')
