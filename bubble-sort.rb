def bubble_sort(unsorted_arr)
  index = 0
  iteration = 1
  while iteration <= (unsorted_arr.size - 1)
    sorted_arr = unsorted_arr.each do |_element|
      if index + 2 <= unsorted_arr.size
        if unsorted_arr[index] > unsorted_arr[index + 1]
          unsorted_arr.insert(index + 2, unsorted_arr[index])
          unsorted_arr.delete_at(index)
          index += 1
          p "value of index: #{index}"
          p "value of arr right now: #{unsorted_arr}"
          unsorted_arr
        else
          index += 1
        end
      end
    end
    iteration += 1
    index = 0
  end
  sorted_arr
end

# p bubble_sort([4, 3, 78, 2, 0, 2])
p bubble_sort([100, 250, 300, 1, 5, 4, 3, 78, 2, 0, 2])
