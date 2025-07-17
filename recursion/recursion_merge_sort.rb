# require "pry-byebug"
# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
# An input of [3, 2, 1, 13, 8, 5, 0, 1] should return [0, 1, 1, 2, 3, 5, 8, 13], and an input of [105, 79, 100, 110] should return [79, 100, 105, 110].

def merge_sort(arr)
  return arr if arr.length == 1

  left_arr = split_left(arr)

  right_arr = split_right(arr, left_arr)

  sorted_left = merge_sort(left_arr)
  sorted_right = merge_sort(right_arr)

  merge_arr(sorted_left, sorted_right)
end

def split_left(arr)
  return arr unless arr.length > 1

  arr[0, arr.length / 2]
end

def split_right(arr, left_arr)
  return arr unless arr.length > 1

  arr[left_arr.length, (arr.length - 1)]
end

def merge_arr(left_arr, right_arr)
  i = 0
  j = 0

  merged_arr = []
  while i <= left_arr.length + right_arr.length

    if i > left_arr.length - 1
      merged_arr.concat(right_arr[j..])
      return merged_arr
    elsif j > right_arr.length - 1
      merged_arr.concat(left_arr[i..])
      return merged_arr
    elsif left_arr[i] < right_arr[j]
      merged_arr << left_arr[i]
      i += 1
    else
      merged_arr << right_arr[j]
      j += 1
    end

  end
  merged_arr
end

puts "The result: #{merge_sort([3, 2, 1, 13, 8, 5, 0, 1])}"
puts "The result: #{merge_sort([79, 100, 105, 110])}"
