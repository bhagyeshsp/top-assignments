# rubocop:disable Style/RedundantSelf
# Contains methods for LinkedList class objects
class LinkedList
  attr_accessor :head

  def initialize
    @count = 0
    @head = nil
  end

  # <LinkedList Obj: @head = <Node Obj: @value="xyz", @next_node=nil>>
  def append(value)
    new_node = Node.new
    new_node.value = value
    if @count.zero?
      @count += 1
      @head = new_node
    else
      last_node = tail(self.head)
      last_node.next_node = new_node
      @count += 1
    end
  end

  def prepend(value)
    # Detach the whole nested node list from the head and make room for prepending
    old_first_node = self.head
    # Create the prepending node
    new_node = Node.new
    new_node.value = value
    # Attach the old nested node list to the new node
    new_node.next_node = old_first_node
    # Attach the whole configuration back
    self.head = new_node
    @count += 1
  end

  def tail(node_obj = self.head)
    if node_obj.next_node.nil?
      node_obj
    else
      tail(node_obj.next_node)
    end
  end

  def size
    @count
  end

  def at(index, counter = 1, node_obj = self.head)
    if counter == index
      node_obj
    else
      counter += 1
      at(index, counter, node_obj.next_node)
    end
  end

  def pop
    second_last_node = self.at(@count - 1)
    second_last_node.next_node = nil
    @count -= 1
  end

  def contains?(value, node_obj = self.head, counter = 1)
    return true if value == node_obj.value
    return false if @count == counter

    counter += 1
    contains?(value, node_obj.next_node, counter)
  end

  # If I input "dog", the function will iterate through all nodes looking for "dog" value and returns its index number
  def find(value, node_obj = self.head, counter = 1)
    return counter if value == node_obj.value
    return nil if counter == @count

    counter += 1
    find(value, node_obj.next_node, counter)
  end

  # ( value ) -> ( value ) -> ( value ) -> nil
  def to_s(arr = [], node_obj = self.head, counter = 1)
    return format_string(arr) if counter > @count

    counter += 1
    arr << node_obj.value
    to_s(arr, node_obj.next_node, counter)
  end

  def format_string(string_array)
    formatted_arr = string_array.map { |value| "( #{value} ) -> " }
    "#{formatted_arr.join} nil"
  end

  # We may need to add a value
  def insert_at(value, index)
    if index == 1 || index > @count
      puts "\n***Error: Instead of using insert_at method, consider using prepend or append methods or make sure the index value is within the range of the object size.\n\n"
    else
      # Find out the value of the nodes right side of the index
      old_detaching_nodes = self.at(index)
      # Find out the node preceding the index
      preceding_node = self.at(index - 1)
      # Create the new node from the input
      new_node = Node.new
      new_node.value = value
      # Attach the new_node to the preceding node
      preceding_node.next_node = new_node
      # Attach the old_detaching_nodes to the new_node
      new_node.next_node = old_detaching_nodes
      @count += 1
    end
  end

  # remove_at(index) that removes the node at the given index
  def remove_at(index)
    if index == 1
      preceding_node = self
      retaining_nodes = self.at(index + 1)
      preceding_node.head = retaining_nodes
      @count -= 1
    elsif index >= @count
      puts "\n***Error: Instead of using remove_at method, consider using pop method or make sure the index value is less than the object size.\n\n"
    else
      preceding_node = self.at(index - 1)
      retaining_nodes = self.at(index + 1)
      preceding_node.next_node = retaining_nodes
      @count -= 1
    end
  end
end
# rubocop:enable Style/RedundantSelf
