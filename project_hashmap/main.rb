require_relative "hashmap"
require_relative "node"
require_relative "linkedlist"

new_hs = HashMap.new

p new_hs.set("Charlie", "admin")
p new_hs.set("Suzanne", "admin")
p new_hs.set("Zack", "admin")
p new_hs.set("Charles", "staff")
p new_hs.set("Zack", "staff")
p new_hs.set("Joey", "admin")
p new_hs
p new_hs.capacity
p new_hs.get("Suzanne")
p new_hs.has?("Joey")
p new_hs.remove("Zack")
p new_hs.remove("zack")
p new_hs.get("Zack")
p new_hs.set("Zack", "admin")
p new_hs.set("Zuber", "staff")
p new_hs.set("Zarina", "admin")
p new_hs
p new_hs.capacity
