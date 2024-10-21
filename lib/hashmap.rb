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
  end

  def get(key)
    code = hash(key) % 16
    @buckets[code] unless @buckets[code].nil?
  end

  def has?(key)
    code = hash(key) % 16
    return false if @buckets[code].nil?

    true
  end

  def remove(key)
    code = hash(key) % 16
    return nil if @buckets[code].nil?

    val = @buckets[code][1]
    @buckets[code] = nil
    val
  end
end

map = HashMap.new
p map.set('ali', 'akeel')
p map.set('ahmed', 'qasim')
p map.remove('ahmed')
