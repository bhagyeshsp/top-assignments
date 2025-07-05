# require "pry-byebug"
# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
# An input of [3, 2, 1, 13, 8, 5, 0, 1] should return [0, 1, 1, 2, 3, 5, 8, 13], and an input of [105, 79, 100, 110] should return [79, 100, 105, 110].

def merge_sort(arr, sorted_arr = [])
  # take the array value
  # split the array evenly
  # binding.pry
  return sorted_arr if sorted_arr.length == arr.length

  # [3, 2, 1, 13, 8, 5, 0, 1]
  # [3, 2, 1, 13]
  if arr.length > 2
    left_arr = split_left(arr)
    p "left one: #{left_arr}"
    sleep 0.5
    # [8, 5, 0, 1]
    right_arr = split_right(arr, left_arr)
    p "right one: #{right_arr}"
    sleep 0.5
    merge_sort(left_arr, sorted_arr)
    merge_sort(right_arr, sorted_arr)
  else
    sorted_arr << sort_arr(arr, sorted_arr)
  end

  # array length of 1 detected, can't split, ready for merge

  # same length of 1 for the right subarray, ready for merge
  # compare the left and right subarray
  # add the lower value to the merge_arr
  # transfer the remaining values to the merge_arr
  # finished merging
  # select the right subarray
  # split the array evenly
end

def split_left(arr)
  return arr unless arr.length > 1

  arr[0, arr.length / 2]
end

def split_right(arr, left_arr)
  return arr unless arr.length > 1

  arr[left_arr.length, (arr.length - 1)]
end

def sort_arr(arr, sorted_arr)
  sorted_arr << [arr[0], arr[1]].min
  sorted_arr << [arr[0], arr[1]].max
  p sorted_arr
end

def merge_arr(left_arr, right_arr)
end

p merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
