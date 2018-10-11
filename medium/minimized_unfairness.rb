def min_unfairness(k, arr)
  arr.sort
     .each_cons(k)
     .map { |subarr| subarr[-1] - subarr[0] }
     .min
end

p min_unfairness(2, [1, 4, 7, 2]) # 1
p min_unfairness(3, [10, 100, 300, 200, 1000, 20, 30]) # 20

# further optimization:
# replace `map` with a loop, return 0 when unfairness is zero


# Problem:
# You will be given a list of integers, arr, and a single integer k. You must create an array of length k from elements of arr such that its unfairness is minimized. Call that array subarr. Unfairness of an array is calculated as
#
# max(subarr) - min(subarr)
#
# Note: Integers in may not be unique.
#
# Function Description
#
# Complete the maxMin function in the editor below. It must return an integer that denotes the minimum possible value of unfairness.
#
# maxMin has the following parameter(s):
#
#     k: an integer, the number of elements in the array to create
#     arr: an array of integers .
