# rubocop:disable Style/ClassVars
# Class definition for HashMap class objects
class HashMap
  @@loadfactor = 0.75
  @@capacity = 0
  @@hash_codes = []

  def initialize
    @buckets = Array.new(16)
  end

  # A class method to check the current capacity of the HashMap
  def self.check_capacity
    @@capacity
  end

  # This method converts a key into a hash code
  def hash(key)
    hash_code = 0
    prime_number = 31
    key.each_char { |char| hash_code = (prime_number * hash_code) + char.ord }
    hash_code % 16
  end

  # If the newly generated hashcode doesn't exist, we increase the capacity value by 1
  def update_capacity(hash_code)
    @@capacity += 1 if @@hash_codes.include?(hash_code)
  end

  # Create a new key-value pair or update an existing one
  def set(key, value)
    index = hash(key)
    raise IndexError if index.negative? || index >= @buckets.length

    update_capacity(index)
    @buckets[index] = [key, value]
  end
end
# rubocop:enable Style/ClassVars

# raise IndexError if index.negative? || index >= @buckets.length
