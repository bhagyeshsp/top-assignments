# rubocop:disable Layout/LineLength
# Class definition for HashMap class objects
class HashMap
  attr_accessor :capacity, :buckets, :size

  # Initialize the HashMap object with a default capacity of 16
  def initialize(capacity = 16)
    @capacity = capacity
    @loadfactor = 0.75
    @size = 0
    @buckets = Array.new(@capacity)
    puts "\n\tHashMap Object initialized with: capacity:#{@capacity}, load_factor:#{@loadfactor}, size:#{@size}, buckets:#{@buckets}\n\n" if DEBUG
  end

  # Returns the total elements in the HashMap object
  # It is kind of similar to the #length method
  def current_load
    @size
  end

  # Checks whether the HashMap object needs expansion
  def need_expansion?
    true if current_load >= (@capacity * @loadfactor)
  end

  # Re-hashes the existing HashMap object and creates an expanded object with a double capacity
  def duplicate_hashmap
    expanded_hashmap_obj = HashMap.new(@capacity * 2)
    old_entries = entries.flatten
    # Convert the old entries arr to hash for easy key-value iteration
    old_entries_hsh = Hash[*old_entries]
    old_entries_hsh.each_pair do |k, v|
      expanded_hashmap_obj.set(k, v)
    end
    expanded_hashmap_obj
  end

  # Copies the content of the expanded HashMap object to the existing object
  def copy_content(expanded_hashmap_obj)
    @buckets = expanded_hashmap_obj.buckets
    @capacity = expanded_hashmap_obj.capacity
    @size = expanded_hashmap_obj.size
  end

  # Returns an index value by converting a key into a hash code and finding a modulo
  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }
    hash_code % @capacity
  end

  # Creates a new key-value pair or updates an existing one
  def set(key, value)
    if need_expansion?
      expanded_hashmap_obj = duplicate_hashmap
      copy_content(expanded_hashmap_obj)
      puts "\tHashMap Object expanded successfully!\n" if DEBUG
    end

    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    @size += 1

    if @buckets[index].nil?
      puts "\tNo bucket exists, creating a new bucket.\n" if DEBUG
      new_bucket = LinkedList.new
      new_bucket.append(key, value)
      @buckets[index] = new_bucket
      puts "\tCreated new bucket: #{new_bucket}\n" if DEBUG
    else
      existing_bucket = @buckets[index]
      if existing_bucket.contains?(key)
        puts "\tA bucket with the provided key already exists.\n" if DEBUG
        position = existing_bucket.find_position(key)
        target_node = existing_bucket.at(position)
        target_node.value = value
        puts "\tThe existing key's value updated: #{value}\n" if DEBUG
      else
        existing_bucket.append(key, value)
        puts "\tkey-values appended to an existing bucket.\n" if DEBUG
      end
    end
  end

  def get(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    # Returns nil if the bucket or its head is nil
    if @buckets[index].nil? || @buckets[index].head.nil?
      nil
    else
      # If bucket is non-nil, but it doesn't contain the key, return nil
      # Happens in case of removal of a node from the linkedlist
      return nil unless @buckets[index].contains?(key)

      # If it contains the key, find the value
      @buckets[index].find_value(key)
    end
  end

  # Checks whether a key exists in the HashMap object
  def has?(key)
    index = hash(key)
    return false if @buckets[index].nil? || @buckets[index].head.nil?

    bucket = @buckets[index]
    bucket.contains?(key)
  end

  # Removes an existing key from the HashMap object
  def remove(key)
    return nil unless has?(key)

    index = hash(key)
    bucket = @buckets[index]
    removal_value = bucket.find_value(key)
    position = bucket.find_position(key)
    puts "\tRemoval method debug info: index:#{index}, bucket:#{bucket}, removal_value:#{removal_value}, position:#{position}.\n" if DEBUG
    bucket.remove_at(position)
    @size -= 1
    removal_value
  end

  # Returns the number of stored keys in the HashMap object
  def length
    non_empty_buckets = @buckets.select { |bucket| !bucket.nil? }
    non_empty_buckets.sum(&:count)
  end

  # Removes all entries from the HashMap object
  def clear
    @buckets = Array.new(16)
    @capacity = 16
    @size = 0
  end

  # Returns an array containing all the keys inside the hash map
  def keys
    # Collect all non-nil buckets in an array
    non_empty_buckets = @buckets.reject(&:nil?)
    puts "\tKeys method debug info: Non empty buckets:#{non_empty_buckets}\n" if DEBUG
    # Iterate through each bucket and collect their keys
    result = non_empty_buckets.map(&:collect_keys)
    result.flatten
  end

  # Returns an array containing all the values inside the HashMap object
  def values
    # Collect all non-nil buckets in an array
    non_empty_buckets = @buckets.reject(&:nil?)
    # Iterate through each bucket and collect their keys
    result = non_empty_buckets.map(&:collect_values)
    result.flatten
  end

  # Returns an array containing all the key-value pairs inside the HashMap object
  def entries
    # Collect all non-nil buckets in an array
    non_empty_buckets = @buckets.reject(&:nil?)
    # Iterate through each bucket and collect their keys
    non_empty_buckets.map(&:collect_pairs)
  end
end
# raise IndexError if index.negative? || index >= @buckets.length
