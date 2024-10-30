class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def find(key)
    current_node = @head
    until current_node.nil?
      return current_node if current_node.value[0] == key

      current_node = current_node.next_node
    end
    nil
  end

  def key_length
    current_node = @head
    keys = 0
    until current_node.nil?
      keys += 1
      return keys if current_node.next_node.nil?

      current_node = current_node.next_node
    end
  end
end
