def maximum_perimeter_triangle(sticks)
  arr = sticks.sort.reverse
  while arr.length >= 3
    return arr[0..2].reverse if arr[0] < arr[1] + arr[2]
    arr.shift
  end
  return [-1] # to prevent error on join
end

p maximum_perimeter_triangle([1, 1, 1, 3, 3]) # [1, 3, 3]
p maximum_perimeter_triangle([1, 2, 3]) # -1

# Probelm:
# Given an array of stick lengths, use of them to construct a non-degenerate triange with the maximum possible perimeter. Print the lengths of its sides as space-separated integers in non-decreasing order.
#
# If there are several valid triangles having the maximum perimeter:
#
#     Choose the one with the longest maximum side.
#     If more than one has that maximum, choose from them the one with the longest minimum side.
#     If more than one has that maximum as well, print any one them.
#
# Function Description
#
#     Complete the maximumPerimeterTriangle function in the editor below. It should return an array of integers that represent the side lengths of the chosen triangle in non-decreasing order.
#
#     maximumPerimeterTriangle has the following parameter(s):
#
#         sticks: an integer array that represents the lengths of sticks available
#
#     Input Format
#
#     The first line contains single integer , the size of array .
#     The second line contains space-separated integers , each a stick length.
