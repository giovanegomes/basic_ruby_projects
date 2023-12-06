# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day.
# It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

def stock_picker(prices)
  p prices.each_with_index.to_a.combination(2).max_by{|buy,sell| sell[0]-buy[0]}
end

stock_picker([17,3,6,9,15,8,6,1,10])