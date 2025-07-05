# Using iteration, write a method #fibs which takes a number and returns an array containing that many numbers from the Fibonacci sequence.
# Using an example input of 8, this function should return the array [0, 1, 1, 2, 3, 5, 8, 13].

def fibs(num)
  i = 0
  fib_seq = []
  if num == 1
    fib_seq = [0]
  elsif num == 2
    fib_seq = [0, 1]
  else
    fib_seq = [0, 1]
    fib_seq << (fib_seq[-2] + fib_seq[-1]) until fib_seq.length == num
    fib_seq
  end
end

puts "Fibonacci sequence generation using iteration"
p fibs(1)
p fibs(2)
p fibs(3)
p fibs(8)

# Now write another method #fibs_rec which solves the same problem recursively.
# Base case is when array_length becomes equal to the provided number
# Recursive case is the recurring operation: adding last two digits in the array to form the next element
def fibs_rec(num, fib_arr = [])
  if num == 1
    [0]
  elsif num == 2
    [0, 1]
  elsif fib_arr.length == num
    fib_arr
  else
    fib_arr = [0, 1] if fib_arr.length < 2
    fib_arr << (fib_arr[-2] + fib_arr[-1])
    fibs_rec(num, fib_arr)
  end
end

puts "Fibonacci sequence generation using recursion"
p fibs_rec(1)
p fibs_rec(2)
p fibs_rec(3)
p fibs_rec(8)
