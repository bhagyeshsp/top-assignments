module Enumerable
  # Your code goes here
  # rubocop: disable Style/For
  def my_each_with_index
    # begin counting from 0, a proxy for index
    i = 0
    for element in self do
      yield(element, i)
      # near the end of each iteration, increase the index value by 1
      i += 1
    end
  end

  def my_select
    result = []
    for element in self do
      if yield(element)
        result << element # add the truthy element to the result array
      else
        result
      end
    end
    result
  end

  def my_all?
    result = []
    for element in self
      result << if yield(element)
                  true
                else
                  false
                end
    end
    # if the result array contains only one unique value, either true or false, means all elements matched the required condition in the block.
    result.uniq.length == 1
  end

  def my_any?
    result = []
    for element in self
      result << if yield(element)
                  true
                else
                  false
                end
    end
    # if the result array contains true and false, means something has matched for given conditions in the block. That's the answer to our any? method
    result.uniq.length > 1
  end

  def my_none?
    result = []
    for element in self
      result << if yield(element)
                  true
                else
                  false
                end
    end
    # if only false is present in the result array, it means all elements returned false, which means, none of the elements returned true. That's the function of none? method
    !(result.include?(false) && result.include?(true))
  end

  def my_count
    i = 0
    for element in self
      if block_given?
        if yield(element) # if block condition matches, increase the count
          i += 1
        else
          i
        end
      else # if no block is provided, increase the count with each element
        i += 1
      end
    end
    i
  end

  def my_map
    result = []
    for element in self
      result << yield(element) # add the return value of the block operation to an array
    end
    result
  end

  # This is also knows as reduce
  def my_inject(initial_value)
    i = 0
    for element in self
      # if it is the first iteration, use initial value
      if i.zero?
        accumulator = yield(initial_value, element)
        i += 1
      else
        # for all consequent iterations, use accumulator and keep updating it
        accumulator = yield(accumulator, element)
      end
    end
    accumulator
  end
end

# rubocop: enable Style/For
# [1, 1, 2, 3, 5, 8, 13, 21, 34]

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
# rubocop: disable Style/For
class Array
  # Define my_each here
  def my_each
    # each do |element|
    #   yield(element)
    # end
    for element in self do
      yield(element)
    end
    self
  end
end
# rubocop: enable Style/For
