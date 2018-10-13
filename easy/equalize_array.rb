def equalize_array(arr)
  freq = Hash.new { |hash, key| hash[key] = 0 }
  arr.each { |elm| freq[elm] += 1 }
  arr.size - freq.values.max
end

p equalize_array([3, 3, 2, 1, 3]) # 2

# Problem:
# Karl has an array of integers. He wants to reduce the array until all remaining elements are equal. Determine the minimum number of elements to delete to reach his goal.
#
# Function Description
#
# Complete the equalizeArray function in the editor below. It must return an integer that denotes the minimum number of deletions required.
#
# equalizeArray has the following parameter(s):
#
#     arr: an array of integers
