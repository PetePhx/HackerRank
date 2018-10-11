def orders_fulfilled(orders)
  orders.map.with_index { |(ord, prep), idx| [ord + prep, idx + 1]}
        .sort
        .map(&:last)
end

p orders_fulfilled([[8, 3], [5, 6], [6, 2], [2, 3], [4, 3]]) # [4, 5, 3, 1, 2]
p orders_fulfilled([[1, 3], [2, 3], [3, 3]]) # [1, 2, 3]



# Problem:
# Jim's Burgers has a line of hungry customers. Orders vary in the time it takes to prepare them. Determine the order the customers receive their orders. Start by numbering each of the customers from 1 to n, front of the line to the back. You will then be given an order number and a preparation time for each customer.
#
# The time of delivery is calculated as the sum of the order number and the preparation time. If two orders are delivered at the same time, assume they are delivered in ascending customer number order. (???)
#
# Function Description
#
# Complete the jimOrders function in the editor below. It should return an array of integers that represent the order that customers' orders are delivered.
#
# input:
# orders: a 2D integer array where each orders[i] is in the form [order[i], prep[i]].
# Note: any orders fulfilled at the same time must be listed by ascending order number. (???)
