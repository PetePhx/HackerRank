def nondivisible_subset(k, set)
  mod_hash = set.group_by { |num| num % k }
                .transform_values { |arr| arr.size }
  mod_hash.default = 0                          # for no-nexisting keys
  out = 0
  (1..(k - 1) / 2).each do |i|
    out += [mod_hash[i], mod_hash[k - i]].max   # can't have members from the two subsets
  end
  out += 1 if mod_hash[0].positive?             # at most one member congruent to k
  out += 1 if k.even? && mod_hash[k / 2].positive? # at most one member congruent to k / 2
  out
end

p nondivisible_subset(4, [19, 10, 12, 10, 24, 25, 22]) # 3 since [19, 22, 25] is a maximal subset
p nondivisible_subset(3, [1, 7, 2, 4]) # 3 since [1, 7, 4] is a maximal subset

=begin

Approach:
- group the S elements by their modulus k
- sum the elements within each category
- we can have at most one member congruent to k
- for even k, we can have at most one member congruent to k / 2
- iterate 1 through (k - 1) / 2
  compare the sizes of the categories i and k - i,
  pick the one largest (we can't have members from both subsets)
- return the sum
=end

# Problem:
# Given a set S of distinct integers, print the size of a maximal subset of S where the sum of any 2 numbers in S' is not evenly divisible by k.
