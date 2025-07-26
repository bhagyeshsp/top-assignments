# Contains methods for all Node objects
class Node
  attr_accessor :key, :value, :next_node

  def initialize
    @key = nil
    @value = nil
    @next_node = nil
  end
end
