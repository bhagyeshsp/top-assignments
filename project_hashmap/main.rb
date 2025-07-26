require_relative "hashmap"

new_hs = HashMap.new
p new_hs

HashMap.new
p HashMap.check_capacity

p new_hs.set("Charlie", "admin")
p new_hs.set("Suzanne", "admin")
p new_hs.set("Zack", "admin")
p new_hs.set("Charles", "staff")
p new_hs.set("Zack", "staff")
p new_hs
