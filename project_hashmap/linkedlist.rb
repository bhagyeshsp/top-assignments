# rubocop:disable Style/RedundantSelf
# Contains methods for LinkedList class objects
class LinkedList
  attr_accessor :head, :count

  def initialize
    @count = 0
    @head = nil
  end

  # <LinkedList Obj: @head = <Node Obj: @value="xyz", @next_node=nil>>
  def append(key, value)
    new_node = Node.new
    new_node.key = key
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

  def prepend(key, value)
    # Detach the whole nested node list from the head and make room for prepending
    old_first_node = self.head
    # Create the prepending node
    new_node = Node.new
    new_node.key = key
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

  # Check whether a key exists?
  def contains?(key, node_obj = self.head, counter = 1)
    return false if node_obj.nil?
    return true if key == node_obj.key
    return false if @count == counter

    counter += 1
    contains?(key, node_obj.next_node, counter)
  end

  # We input key and output its related value if it is present
  def find_value(key, node_obj = self.head, counter = 1)
    return node_obj.value if key == node_obj.key
    return nil if @count == counter

    counter += 1
    find_value(key, node_obj.next_node, counter)
  end

  # Find position of the provided key in the linkedlist object
  def find_position(key, node_obj = self.head, counter = 1)
    return counter if key == node_obj.key
    return nil if counter == @count

    counter += 1
    find_position(key, node_obj.next_node, counter)
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

  def update_node(key, value, index)
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

  def collect_keys(node_obj = self.head, keys = [])
    keys << node_obj.key
    return keys if node_obj.next_node.nil? || node_obj.nil?

    collect_keys(node_obj.next_node, keys)
  end

  def collect_values(node_obj = self.head, values = [])
    values << node_obj.value
    return values if node_obj.next_node.nil? || node_obj.nil?

    collect_values(node_obj.next_node, values)
  end

  def collect_pairs(node_obj = self.head, pairs = [])
    pairs << [node_obj.key, node_obj.value]
    return pairs if node_obj.next_node.nil? || node_obj.nil?

    collect_pairs(node_obj.next_node, pairs)
  end

  def find_position(key, node_obj = self.head, counter = 1)
    return counter if key == node_obj.key
    return nil if counter == @count

    counter += 1
    find_position(key, node_obj.next_node, counter)
  end
end
# rubocop:enable Style/RedundantSelf
