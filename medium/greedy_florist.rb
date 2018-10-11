def greedy_florist(k, prices)
  pr_arr = prices.sort.reverse # decreasing
  sz = pr_arr.size
  multpliers = (1..(sz / k + 1)).map { |elm| [elm] * k }.flatten # price multipliers
  (0...sz).map { |idx| pr_arr[idx] * multpliers[idx] }.sum
end

p greedy_florist(3, [2, 5, 6]) # 13
p greedy_florist(2, [2, 5, 6]) # 15
p greedy_florist(3, [1, 3, 5, 7, 9]) # 29

# Problem:
# A group of friends want to buy a bouquet of flowers. The florist wants to maximize his number of new customers and the money he makes. To do this, he decides he'll multiply the price of each flower by the number of that customer's previously purchased flowers plus 1. The first flower will be original price, () + 1) * price, the next will be (1 + 1) * price, and so on.
#
# Given the size of the group of friends, the number of flowers they want to purchase and the original prices of the flowers, determine the minimum cost to purchase all of the flowers.
#
# Function Description
#
# Complete the getMinimumCost function in the editor below. It should return the minimum cost to purchase all of the flowers.
#
# getMinimumCost has the following parameter(s):
#
#     c: an array of integers representing the original price of each flower
#     k: an integer, the number of friends
