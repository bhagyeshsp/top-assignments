# Provides methods to generate and edit linkedlist
class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    node = Node.new
    node.value = value
    node.next_node = @list.size + 1
    @list.push(node)
  end

  def prepend(value)
    node = Node.new
    node.value = value
    node.next_node = 1
    @list.unshift(node)
    increment_all_right_next_nodes(1)
  end

  def increment_all_right_next_nodes(start_index)
    i = start_index
    while i <= @list.size - 1
      @list[i].next_node += 1
      i += 1
    end
  end

  def size
    @list.size
  end

  def head
    @list.first
  end

  def tail
    @list.last
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
  end

  def contains?(value)
    result = @list.select { |node| node.value == value }
    !result.empty?
  end

  def find(value)
    matching_node = @list.select { |node| node.value == value }
    @list.index(matching_node.first)
  end

  # ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    string = @list.map do |node|
      "( #{node.value} ) -> "
    end
    "#{string.join} nil"
  end

  def insert_at(value, index)
    increment_all_right_next_nodes(index)
    node = Node.new
    node.value = value
    node.next_node = index + 1
    @list.insert(index, node)
  end

  def remove_at(index)
    @list.delete_at(index)
    decrement_all_right_next_nodes(index)
  end

  def decrement_all_right_next_nodes(start_index)
    i = start_index
    while i <= @list.size - 1
      @list[i].next_node -= 1
      i += 1
    end
  end
end
