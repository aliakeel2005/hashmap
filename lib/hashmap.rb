require_relative 'node'

class HashMap
  def initialize(load_factor = 0.75)
    @buckets = Array.new(16)
    @load_factor = load_factor
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def self.length
    length = 0
    @buckets.each do |bucket|
      length += 1 unless bucket.nil?
    end
    length
  end

  def set(key, value)
    hash = hash(key) % 16
    if @buckets[hash].nil?
      raise IndexError if hash.negative? || hash >= @buckets.length

      @buckets[hash] = [key, value]
    elsif key == @buckets[hash][0]
      @buckets[hash][1] = value
    else

    end
  end

  def test
    p @buckets.size * @load_factor
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

  def length
    length = 0
    @buckets.each do |bucket|
      length += 1 unless bucket.nil?
    end
    length
  end

  def clear
    @buckets = Array.new(@buckets.size)
  end

  def keys
    keys = ''
    @buckets.each do |bucket|
      keys += "[#{bucket[0]}] " unless bucket.nil?
    end
    keys
  end

  def values
    values = ''
    @buckets.each do |bucket|
      values += "[#{bucket[1]}] " unless bucket.nil?
    end
    values
  end

  def entries
    entries = ''
    @buckets.each do |bucket|
      entries += "[#{bucket[0]}, #{bucket[1]}], " unless bucket.nil?
    end
    entries
  end
end

map = HashMap.new
p map.set('ali', 'akeel')
p map.length
