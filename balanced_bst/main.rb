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
test_tree.delete(600)
p test_tree
# test_tree.pretty_print
# test_tree.delete(9)
# test_tree.pretty_print
# test_tree.delete(8)
# test_tree.pretty_print
# test_tree.delete(23)
# test_tree.pretty_print
# test_tree.find(5)
# # test_tree.level_order
# p test_tree
# Invoking the level_order method without a block returns an array
p test_tree.level_order
# Invoking the level_order method with a block is possible
test_tree.level_order.each do |node|
  puts "\t#{node}\n\n"
end
p test_tree.preorder
test_tree.preorder.each { |node| puts node.value }
puts "--inorder---"
test_tree.inorder.each { |node| puts node.value }
puts "--postorder---"
test_tree.postorder.each { |node| puts node.value }
p test_tree.height(100)
p test_tree.depth(6345)
# Let's imbalance the tree
test_tree.insert(100)
test_tree.insert(101)
test_tree.insert(5000)
test_tree.insert(5001)
test_tree.insert(5002)
test_tree.insert(5003)
# Now let's check whether it works
puts test_tree.balanced?
# Print the unbalanced tree for visual inspection
test_tree.pretty_print
# Now let's rebalance it
test_tree.rebalance
# Print it for visual inspection
test_tree.pretty_print
# Recheck whether the method rightly identifies it as balanced
puts test_tree.balanced?
