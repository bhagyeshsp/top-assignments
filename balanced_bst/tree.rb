# require "pry-byebug"

class Tree
  def initialize
    @root = nil
  end

  def build_tree(arr)
    sorted_arr = arr.uniq.sort
    mid = find_middle_index(0, sorted_arr.length - 1)
    # Create root node
    root_node = Node.new
    root_node.value = sorted_arr[mid]
    @root = root_node
    root_node.left = build_children(sorted_arr, 0, mid - 1)
    root_node.right = build_children(sorted_arr, mid + 1, sorted_arr.length - 1)
  end

  def find_middle_index(start, last)
    (start + last) / 2
  end

  def build_children(sorted_arr, start, last)
    return nil if start > last

    mid = (start + last) / 2
    new_node = Node.new
    new_node.value = sorted_arr[mid]
    new_node.left = build_children(sorted_arr, start, mid - 1)
    new_node.right = build_children(sorted_arr, mid + 1, last)
    new_node
  end

  def insert(key, curr_node = @root)
    p curr_node
    curr_node.insert(key, curr_node)
  end

  def delete(key, curr_node = @root)
    curr_node.delete(key, curr_node)
  end

  def find(key, curr_node = @root)
    curr_node.find(key, curr_node)
  end

  # This is a recursive version of the method
  def level_order(queue = [@root])
    return if queue.empty?

    queue.push(queue[0].left) unless queue[0].left.nil?
    queue.push(queue[0].right) unless queue[0].right.nil?
    p queue.shift.value
    level_order(queue)
  end

  # This is an iterative version of the level_order method:

  # def level_order
  #   return if @root.nil?

  #   queue = []
  #   queue.push(@root)
  #   until queue.empty?
  #     curr_node = queue.shift
  #     p curr_node.value
  #     queue.push(curr_node.left) unless curr_node.left.nil?
  #     queue.push(curr_node.right) unless curr_node.right.nil?

  #   end
  # end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
