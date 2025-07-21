require_relative "linkedlist"
require_relative "node"

list = LinkedList.new

list.append("dog")
list.append("cat")
list.append("parrot")
list.append("hamster")
list.append("snake")
list.append("turtle")

puts list

list.insert_at("lion", 3)
puts list
p list

list.remove_at(3)
puts list
p list
