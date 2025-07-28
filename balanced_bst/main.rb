require_relative "tree"
require_relative "node"

test_tree = Tree.new
p test_tree
test_tree.build_tree([1, 2, 3, 4, 5])
p test_tree
