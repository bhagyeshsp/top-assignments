def stock_picker(stock_price_arr)
# Create all possible combinations of the stock prices
combo_arr = []
stock_price_arr.repeated_combination(2) {|combination| combo_arr.push(combination) }
p combo_arr
# Check for the least numerical value between two elements of a pair
result = combo_arr.reduce([0]) do |a, element|
  p "value of a is: #{a}"
  if (element[0] - element[1]) < (a[0][0] - a[0][1])
    a.clear
    a << element
    a
  else
    a
  end
end
p result
p buy_day_index = stock_price_arr.index(result.flatten[0])
p sell_day_index = stock_price_arr.index(result.flatten[1])
stock_days = [buy_day_index, sell_day_index]
end

p stock_picker([17,3,6,9,15,8,6,1,10])
