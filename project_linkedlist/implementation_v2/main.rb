require_relative "linkedlist"
require_relative "node"

list = LinkedList.new
list.append("dog")
p list
list.append("cat")
p list
list.append("elephant")
p list
list.prepend("cow")
p list
p list.at(4)
list.pop
p list
p list.contains?("abc")
p list.find("cat")
p list.find("abc")
puts list
list.insert_at("elephant", 2)
puts list
# list.insert_at("tiger", 1)
# puts list
list.remove_at(3)
puts list
# p list
list.remove_at(2)
puts list
list.remove_at(3)
puts list
