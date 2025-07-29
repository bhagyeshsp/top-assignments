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
    root_node.left = recursive_method(sorted_arr, 0, mid - 1)
    root_node.right = recursive_method(sorted_arr, mid + 1, sorted_arr.length - 1)
  end

  def find_middle_index(start, last)
    (start + last) / 2
  end

  def recursive_method(sorted_arr, start, last)
    return nil if start > last

    mid = (start + last) / 2
    new_node = Node.new
    new_node.value = sorted_arr[mid]
    new_node.left = recursive_method(sorted_arr, start, mid - 1)
    new_node.right = recursive_method(sorted_arr, mid + 1, last)
    new_node
  end

  def insert(key, curr_node = @root)
    p curr_node
    curr_node.insert(key, curr_node)
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.value}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
