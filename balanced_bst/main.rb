require_relative "tree"
require_relative "node"

test_tree = Tree.new
p test_tree
test_tree.build_tree([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p test_tree
test_tree.pretty_print
test_tree.insert(600)
p test_tree
test_tree.pretty_print
