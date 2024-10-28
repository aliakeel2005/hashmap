class Node
  @@node_count = 0
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
    @@node_count += 1
  end

  def self.size
    @@node_count
  end
end
