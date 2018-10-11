def max_toys(prices, amount)
  arr = prices.sort
  running_total = 0
  items = 0
  arr.each do |price|
    added = price + running_total
    return items if added > amount
    running_total = added
    items += 1
  end
  return items
end

p max_toys([1, 12, 5, 111, 200, 1000, 10], 50) #4
# Problem:
# Mark and Jane are very happy after having their first child. Their son loves toys, so Mark wants to buy some. There are a number of different toys lying in front of him, tagged with their prices. Mark has only a certain amount to spend, and he wants to maximize the number of toys he buys with this money.
#
# Given a list of prices and an amount to spend, what is the maximum number of toys Mark can buy?
