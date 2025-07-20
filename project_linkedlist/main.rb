require_relative "linkedlist"
require_relative "node"

list = LinkedList.new
list.append("dog")
p list

list.prepend("cat")
p list
puts list
