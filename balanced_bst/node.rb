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

  def delete(key, curr_node)
    # Base case
    return curr_node if curr_node.nil?

    # If key to be searched is in a subtree
    if curr_node.value > key
      curr_node.left = delete(key, curr_node.left)
    elsif curr_node.value < key
      curr_node.right = delete(key, curr_node.right)
    else
      # If root matches with the given key
      # Cases when root has 0 children or only right child
      return curr_node.right if curr_node.left.nil?
      # When root has only left child
      return curr_node.left if curr_node.right.nil?

      # When both children are present
      succ = get_successor(curr_node)
      curr_node.value = succ.value
      curr_node.right = delete(succ.value, curr_node.right)
    end
    curr_node
  end

  def get_successor(curr_node)
    curr_node = curr_node.right
    curr_node = curr_node.left while !curr_node.nil? && !curr_node.left.nil?
    curr_node
  end

  def find(key, curr_node)
    # Base case
    return curr_node if curr_node.value == key

    # If key to be searched is in a subtree
    if curr_node.value > key
      curr_node.left = find(key, curr_node.left)
    elsif curr_node.value < key
      curr_node.right = find(key, curr_node.right)
    end
  end
end
