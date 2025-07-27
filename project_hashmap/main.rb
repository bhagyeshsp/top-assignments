require_relative "hashmap"
require_relative "node"
require_relative "linkedlist"
DEBUG = false
# new_hs = HashMap.new

# p new_hs.set("Charlie", "admin")
# p new_hs.set("Suzanne", "admin")
# p new_hs.set("Zack", "admin")
# p new_hs.set("Charles", "staff")
# p new_hs.set("Zack", "staff")
# p new_hs.set("Joey", "admin")
# p new_hs
# p new_hs.capacity
# p new_hs.get("Suzanne")
# p new_hs.has?("Joey")
# p new_hs.remove("Zack")
# p new_hs.remove("zack")
# p new_hs.get("Zack")
# p new_hs.set("Zack", "admin")
# p new_hs.set("Zuber", "staff")
# p new_hs.set("Zarina", "admin")
# p new_hs
# p new_hs.capacity
# p new_hs.length
# p new_hs.set("Anil", "admin")
# p new_hs.set("Barbara", "admin")
# puts "-----------------"
# p new_hs
# puts "-----------------"
# p new_hs.length
# p new_hs.keys
# p new_hs.values
# p new_hs.entries
# p new_hs.clear
# p new_hs
test = HashMap.new

test.set("apple", "red")
test.set("banana", "yellow")
test.set("carrot", "orange")
test.set("dog", "brown")
test.set("elephant", "gray")
test.set("frog", "green")
test.set("grape", "purple")
test.set("hat", "black")
test.set("ice cream", "white")
test.set("jacket", "blue")
test.set("kite", "pink")
test.set("lion", "golden")
p test

test.set("moon", "silver")
puts "\nadd moon\n"
p test

test.set("sun", "white")
puts "\nadd sun\n"
p test
