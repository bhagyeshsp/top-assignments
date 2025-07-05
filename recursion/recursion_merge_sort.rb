# require "pry-byebug"
# Build a method #merge_sort that takes in an array and returns a sorted array, using a recursive merge sort methodology.
# An input of [3, 2, 1, 13, 8, 5, 0, 1] should return [0, 1, 1, 2, 3, 5, 8, 13], and an input of [105, 79, 100, 110] should return [79, 100, 105, 110].

def merge_sort(arr, sorted_arr = [])
  # take array
  # begin splitting
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

def merge_arr(left_arr, right_arr)
end

merge_sort([3, 2, 1, 13, 8, 5, 0, 1])
