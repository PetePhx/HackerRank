def candies(n, arr)
  diff_signs = arr.each_cons(2).map { |a, b| b <=> a } # array elms -1, 0, +1
  diff_arrs = compartmentalize(diff_signs)
  final_candies = [1]
  diff_arrs.each_with_object(final_candies) do |subarr, obj|
    sz = subarr.size
    case subarr[0]
    when +1
      obj.push(*(2..(sz + 1)).to_a)
    when 0
      obj.push(*([1] * sz))
    when -1
      candies_subarr = (1..sz).to_a.reverse
      obj[-1] = candies_subarr.first + 1 if obj[-1] <= candies_subarr.first
      obj.push(*candies_subarr)
    end
  end
  final_candies.sum
end

def compartmentalize(arr) # each sequence of equal elements put in a subarray
  return [] if arr.empty?
  arr.drop(1).each_with_object([[arr.first]]) do |elm, obj|
    elm == obj.last.last ? obj.last << elm : obj << [elm]
  end
end

p candies(3, [1, 2, 2]) # 4
p candies(10, [2, 4, 2, 6, 1, 7, 8, 9, 2, 1]) # 19
p candies(8, [2, 4, 3, 5, 2, 6, 4, 5]) # 12

p candies(5, [5, 4, 3, 2, 1]) # 15


=begin
Approach:
- create an array of diff signs: +1 for increase, -1 decrease, 0 equal
- segment the array to subarrays of same sign

- initialize final_candies array to [1]

- iterate through the array of arrays of signs
  - for an array of [+1,..., +1] append [2, 3, ... sz + 1] to final cookies
  - for an array of [0, 0, ... 0], append [1, 1, ... sz] to final cookies
  - for an array of [-1, -1, ..., -1]:
    - build an array of [sz, sz - 1, ..., 1]
    - if the last element of the final_candies <= sz, bump it to sz + 1

- return final_candies.sum
=end

# Problem:
# Alice is a kindergarten teacher. She wants to give some candies to the children in her class.  All the children sit in a line and each of them has a rating score according to his or her performance in the class.  Alice wants to give at least 1 candy to each child. If two children sit next to each other, then the one with the higher rating must get more candies. Alice wants to minimize the total number of candies she must buy.
#
# For example, assume her students' ratings are [4, 6, 4, 5, 6, 2]. She gives the students candy in the following minimal amounts: [1, 2, 1, 2, 3, 1]. She must buy a minimum of 10 candies.
#
# Function Description
#
# Complete the candies function in the editor below. It must return the minimum number of candies Alice must buy.
#
# candies has the following parameter(s):
#
#     n: an integer, the number of children in the class
#     arr: an array of integers representing the ratings of each student
# Sample Input 0
#
# 3
# 1
# 2
# 2
#
# Sample Output 0
#
# 4
#
# Explanation 0
#
# Here 1, 2, 2 is the rating. Note that when two children have equal rating, they are allowed to have different number of candies. Hence optimal distribution will be 1, 2, 1.
