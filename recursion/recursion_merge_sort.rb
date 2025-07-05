# require "pry-byebug"
# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
# An input of [3, 2, 1, 13, 8, 5, 0, 1] should return [0, 1, 1, 2, 3, 5, 8, 13], and an input of [105, 79, 100, 110] should return [79, 100, 105, 110].

def merge_sort(arr)
  # take array
  # check for base case
  puts "-------------------"
  puts "new arr value: #{arr.inspect}"
  if arr.length == 1
    puts "oh, got the return: #{arr.inspect}"
    return arr
  end

  left_arr = split_left(arr)
  sleep 0.5
  # p left_arr
  right_arr = split_right(arr, left_arr)
  sleep 0.5
  # p right_arr
  sorted_left = merge_sort(left_arr)
  sorted_right = merge_sort(right_arr)

  merge_arr(sorted_left, sorted_right)

  # if not basecase
  #   begin splitting
  #   select left subarray
  #     begin splitting
  #       select left subarray
  #         hit the length of 1?
  #           begin comparing left and right subarrays
  #             select the smaller of the two
  #               add it to a new array
  #                 add the remaining element to that array
  #   select right subarray
  #     begin splitting
  #       select left subarray
  #         begin splitting
  #           select the left subarray
  #             hit the length of 1?
  #           begin comparing left and right subarrays
  #             select the smaller of the two
  #               add it to a new array
  #                 add the remaining element to that array
  #
  # Method comparing multi-element array with another multi-element array

  # select the new array on left-side and new array on right side
  #   compare left_array's 1st element with right_array's 1st element
  #     add the smaller value to a new array AND remove it from the array
  #   compare left_array's 1st element with right_array's 1st element
  #     add the smaller value to a new array AND remove it from the array
  #   repeat the steps until the merged array length is not equal to original array's length
end

def split_left(arr)
  return arr unless arr.length > 1

  arr[0, arr.length / 2]
end

def split_right(arr, left_arr)
  return arr unless arr.length > 1

  arr[left_arr.length, (arr.length - 1)]
end

def sort_arr(left_arr, right_arr, sorted_arr)
  sorted_arr << [left_arr[0], right_arr[0]].min
  sorted_arr << [left_arr[0], right_arr[0]].max
  sorted_arr
end

def sort_arr2(left_arr, right_arr, sorted_arr)
  i = 0
  while i <= [left_arr.length, right_arr.length].max
    return sorted_arr << right_arr[0] if left_arr.empty?
    return sorted_arr << left_arr[0] if right_arr.empty?

    if left_arr[0] < right_arr[0]
      sorted_arr << left_arr[0]
      left_arr.shift
    else
      sorted_arr << right_arr[0]
      right_arr.shift
    end
    i += 1
  end
  sorted_arr
end

def merge_arr(left_arr, right_arr)
  i = 0
  j = 0
  # p left_arr
  # p right_arr
  merged_arr = []
  while i <= left_arr.length + right_arr.length
    # return merged_arr << right_arr[0] if left_arr.empty?
    # return merged_arr << left_arr[0] if right_arr.empty?
    if i > left_arr.length - 1
      merged_arr << right_arr[j]
      return merged_arr
    elsif j > right_arr.length - 1
      merged_arr << left_arr[i]
      return merged_arr
    elsif left_arr[i] < right_arr[j]
      merged_arr << left_arr[i]
      i += 1
      puts "merged_arr if value: #{merged_arr}"
    else
      merged_arr << right_arr[j]
      j += 1
      puts "merged_arr else value: #{merged_arr}"
    end

  end
  merged_arr
end

puts "The result: #{merge_sort([3, 2, 1, 13, 8, 5, 0, 1])}"
