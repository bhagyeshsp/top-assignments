# require "pry-byebug"
# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
# An input of [3, 2, 1, 13, 8, 5, 0, 1] should return [0, 1, 1, 2, 3, 5, 8, 13], and an input of [105, 79, 100, 110] should return [79, 100, 105, 110].

def merge_sort(arr, depth = 0)
  indent = " " * depth * 2
  puts "#{indent}-------------------"
  puts "#{indent}new arr value: #{arr.inspect}"
  if arr.length == 1
    puts "#{indent}oh, got the return: #{arr.inspect}"
    return arr
  end

  left_arr = split_left(arr)
  sleep 0.5
  # p left_arr
  right_arr = split_right(arr, left_arr)
  sleep 0.5
  # p right_arr
  sorted_left = merge_sort(left_arr, depth + 1)
  sorted_right = merge_sort(right_arr, depth + 1)

  merge_arr(sorted_left, sorted_right, depth + 1)
end

def split_left(arr)
  return arr unless arr.length > 1

  arr[0, arr.length / 2]
end

def split_right(arr, left_arr)
  return arr unless arr.length > 1

  arr[left_arr.length, (arr.length - 1)]
end

def merge_arr(left_arr, right_arr, depth = 0)
  indent = " " * depth * 2
  i = 0
  j = 0
  # p left_arr
  # p right_arr
  merged_arr = []
  while i <= left_arr.length + right_arr.length

    if i > left_arr.length - 1
      merged_arr.concat(right_arr[j..])
      puts "#{indent}merged_arr value ran out of i: #{merged_arr}"
      return merged_arr
    elsif j > right_arr.length - 1
      merged_arr.concat(left_arr[i..])
      puts "#{indent}merged_arr value ran out of j: #{merged_arr}"
      return merged_arr
    elsif left_arr[i] < right_arr[j]
      merged_arr << left_arr[i]
      i += 1
      puts "#{indent}merged_arr if value: #{merged_arr}"
    else
      merged_arr << right_arr[j]
      j += 1
      puts "#{indent}merged_arr else value: #{merged_arr}"
    end

  end
  merged_arr
end

puts "The result: #{merge_sort([3, 2, 1, 13, 8, 5, 0, 1])}"
# puts "The result: #{merge_sort([79, 100, 105, 110])}"
