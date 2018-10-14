def circular_arr_rot(arr, k, queries)
  arr.rotate(-1 * (k % arr.size)).values_at(*queries)
end

# Problem:
# John Watson knows of an operation called a right circular rotation on an array of integers. One rotation operation moves the last array element to the first position and shifts all remaining elements right one. To test Sherlock's abilities, Watson provides Sherlock with an array of integers. Sherlock is to perform the rotation operation a number of times then determine the value of the element at a given position.
#
# For each array, perform a number of right circular rotations and return the value of the element at a given index.
#
# Function Description
#
# Complete the circularArrayRotation function in the editor below. It should return an array of integers representing the values at the specified indices.
#
# circularArrayRotation has the following parameter(s):
#
#     a: an array of integers to rotate
#     k: an integer, the rotation count
#     queries: an array of integers, the indices to report
#
#     Output Format
#
# For each query, print the value of the element at index m of the rotated array on a new line.
