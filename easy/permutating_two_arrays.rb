def two_arrays(k, arr1, arr2)
  arr1.sort
      .zip(arr2.sort.reverse)
      .map(&:sum)
      .min >= k ? p('YES') : p('NO')
end

two_arrays(10, [2, 1, 3], [7, 8, 9]) # "YES"
two_arrays(5, [1, 2, 2, 1], [3, 3, 3, 4]) # "NO"

# Problem:
# Consider two n-element arrays of integers A, B. You want to permute them into some A' and B' and such that the relation A'[i] + B'[i] >= k holds for all i.
#
# Function Description
#
# Complete the twoArrays function in the editor below. It should return a string, either YES or NO.
#
# twoArrays has the following parameter(s):
#
#     k: an integer
#     A: an array of integers
#     B: an array of integers
