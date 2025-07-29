class Node
  include Comparable

  attr_accessor :value, :left, :right

  def initialize
    @value = nil
    @left = nil
    @right = nil
  end

  def insert(key, curr_node)
    if curr_node.nil?
      key_node = Node.new
      key_node.value = key
      return key_node
    end
    return nil if key == curr_node.value

    if curr_node.value > key
      curr_node.left = insert(key, curr_node.left)
    elsif curr_node.value < key
      curr_node.right = insert(key, curr_node.right)
    end
    curr_node
  end
end
