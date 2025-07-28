class Tree
  def initialize
    @root = nil
  end

  def build_tree(arr)
    sorted_arr = arr.uniq.sort
    recursive_method(sorted_arr, 0, sorted_arr.length - 1)
  end

  # call this function with (start = 0) and (last = arr.length - 1) arguments
  def recursive_method(sorted_arr, start, last)
    return nil if start > last

    # Find the middle element
    mid = start + ((last - start) / 2)

    if @root.nil?
      # Create root node
      root_node = Node.new
      root_node.value = sorted_arr[mid]
      @root = root_node
    end

    # Create left subtree
    @root.left = recursive_method(sorted_arr, start, mid - 1)

    # Create right subtree
    @root.right = recursive_method(sorted_arr, mid + 1, last)

    @root
  end

  def pretty_print(node = @root, prefix = "", is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  # [1, 2, 3, 4, 5, 6, 7]
  # <TreeObj @root=<NodeObj @data=4 @left=<NodeObj @data=2 @left=<NodeObj @data=1 @left=nil @right=nil> @right=<NodeObj @data=3 @left=nil @right=nil>> @right=<NodeObj @data=6 @left=<NodeObj @data=5 @left=nil @right=nil>  @right=<NodeObj @data=7 @left=nil @right=nil>>>
end
