# Provides methods to generate and edit linkedlist
class LinkedList
  def initialize
    @list = []
  end

  def append(value)
    @list.push(value)
  end

  def prepend(value)
    @list.unshift(value)
  end

  def size
    @list.size
  end

  def head
    @list.first
  end

  def tail
    @list.last
  end

  def at(index)
    @list[index]
  end

  def pop
    @list.pop
  end

  def contains?(value)
    @list.contains?(value)
  end

  def find(value)
  end

  # ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    string = @list.map do |node|
      "( #{node} ) -> "
    end
    "#{string.join} nil"
  end
end
