# rubocop:disable Style/ClassVars
# Class definition for HashMap class objects
class HashMap
  @@loadfactor = 0.75

  def initialize
    @buckets = Array.new(16)
  end

  # A class method to check the current capacity of the HashMap
  def capacity
    @buckets.length - @buckets.count(nil)
  end

  # This method converts a key into a hash code
  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }
    hash_code % 16
  end

  # Create a new key-value pair or update an existing one
  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    if @buckets[index].nil?
      new_bucket = LinkedList.new
      new_bucket.append(key, value)
      @buckets[index] = new_bucket
    else
      existing_bucket = @buckets[index]
      # if bucket index is not nil, check for existing keys
      # if a key exists
      # find out its bucket position
      # update the node at that position
      if existing_bucket.contains?(key)
        position = existing_bucket.find_position(key)
        target_node = existing_bucket.at(position)
        target_node.value = value

      # if a key doesnt exist, append the node
      else
        existing_bucket.append(key, value)

      end

    end
  end

  def get(key)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    # return nil if the bucket or its head is nil
    if @buckets[index].nil? || @buckets[index].head.nil?
      nil
    else
      # if bucket is not nil, but it doesn't contain the key, return nil
      return nil unless @buckets[index].contains?(key)

      # if it contains the key, find the value
      @buckets[index].find_value(key)
    end
  end

  def has?(key)
    index = hash(key)
    return false if @buckets[index].nil? || @buckets[index].head.nil?

    bucket = @buckets[index]
    bucket.contains?(key)
  end

  def remove(key)
    return nil unless has?(key)

    index = hash(key)
    bucket = @buckets[index]
    removal_value = bucket.find_value(key)
    position = bucket.find_position(key)
    bucket.remove_at(position)
    removal_value
  end

  # Returns the number of stored keys in the HashMap object
  def length
    non_empty_buckets = @buckets.select { |bucket| !bucket.nil? }
    non_empty_buckets.sum(&:count)
  end

  def clear
    @buckets = Array.new(16)
  end

  # Returns an array containing all the keys inside the hash map
  def keys
    # Collect all non-nil buckets in an array
    non_empty_buckets = @buckets.reject(&:nil?)
    # Iterate through each bucket and collect their keys
    result = non_empty_buckets.map(&:collect_keys)
    result.flatten
  end

  def values
    # Collect all non-nil buckets in an array
    non_empty_buckets = @buckets.reject(&:nil?)
    # Iterate through each bucket and collect their keys
    result = non_empty_buckets.map(&:collect_values)
    result.flatten
  end

  def entries
    # Collect all non-nil buckets in an array
    non_empty_buckets = @buckets.reject(&:nil?)
    # Iterate through each bucket and collect their keys
    non_empty_buckets.map(&:collect_pairs)
  end
end
# rubocop:enable Style/ClassVars

# raise IndexError if index.negative? || index >= @buckets.length
