class Node
  include Comparable

  attr_accessor :value, :left, :right

  def initialize
    @value = nil
    @left = nil
    @right = nil
  end
end
