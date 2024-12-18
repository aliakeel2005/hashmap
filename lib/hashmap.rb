require_relative 'node'
require_relative 'linkedlist'
class HashMap < LinkedList
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

  def expand_buckets
    return unless length > @buckets.size * @load_factor

    new_buckets = Array.new(@buckets.size * 2)
    @buckets.each do |bucket|
      next unless bucket

      bucket.each do |node|
        hash = hash(node.value[0]) % new_buckets.size
        new_buckets[hash] ||= LinkedList.new
        new_buckets[hash].append(node.value)
      end
    end
    @buckets = new_buckets
    p 'buckets expanded'
  end

  def set(key, value)
    expand_buckets if length > @buckets.size * @load_factor
    hash = hash(key) % @buckets.size
    if @buckets[hash].nil?
      raise IndexError if hash.negative? || hash >= @buckets.length

      @buckets[hash] = LinkedList.new
    end

    node = @buckets[hash].find(key)
    if node
      node.value[1] = value
    else
      @buckets[hash].append([key, value])
    end
  end

  def test
    p length
    return unless length > @buckets.size * @load_factor

    p 'load factor exceeded'
  end

  def get(key)
    code = hash(key) % @buckets.size
    @buckets[code].find(key).value[1] unless @buckets[code].nil?
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
      next if bucket.nil?

      length += bucket.key_length
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
map.set('apple', 'red')
map.set('banana', 'yellow')
map.set('carrot', 'orange')
map.set('dog', 'brown')
map.set('elephant', 'gray')
map.set('frog', 'green')
map.set('grape', 'purple')
map.set('hat', 'black')
map.set('ice cream', 'white')
map.set('jacket', 'blue')
map.set('kite', 'pink')
map.set('lion', 'golden')
map.set('silver', 'bullshit')
map.set('who', 'cares')
map.test
p map.get('lion')
map.set('who', 'i care')
map.test
