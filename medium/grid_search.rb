def grid_search(in_grid, in_pattern)
  grid = in_grid.map(&:chars)
  pat = in_pattern.map(&:chars)
  g_ln, g_wd = [grid.length, grid[0].length] # length and width for the grid
  p_ln, p_wd = [pat.length, pat[0].length]   # and the pattern
  idx_arr = []
  return p('NO') if p_ln > g_ln || p_wd > g_wd

  (0..g_ln - p_ln).each do |i|
    (0..g_wd - p_wd).each do |j|
      idx_arr << [i, j] if grid[i][j] == pat[0][0] # find all possible corner matches
    end
  end
  idx_arr.any? { |i, j| full_match?(grid, pat, i, j, p_ln, p_wd) } ? p('YES') : p('NO')
end

def full_match?(grid, pat, i, j, p_ln, p_wd)
  (0...p_ln).each do |idx|
    (0...p_wd).each do |jdx|
      return false if grid[i + idx][j + jdx] != pat[idx][jdx]
    end
  end
  true
end

grid = [
  '1234567890',
  '0987654321',
  '1111111111',
  '1111111111',
  '2222222222'
]

pat = [
  '876543',
  '111111',
  '111111'
]

p grid_search(grid, pat)

=begin
Approach:
- convert input arrays of string to 2D arrays
- find all occurences of pat[0][0] in grid (array of [i, j])
- for each [i, j], check for full match between grid and pattern
  - grid.slice(i, i + pat.size - 1).map { |row| row.slice(j, j + pat[0].size - 1)} == pat
- if there is a full match, return p('YES')
- otherwise p('NO')

=end

# Problem:
# Given a 2D array of digits or grid, try to find the occurrence of a given 2D pattern of digits. For example, consider the following grid:
#
# 1234567890
# 0987654321
# 1111111111
# 1111111111
# 2222222222
#
# Assume we need to look for the following 2D pattern array:
#
# 876543
# 111111
# 111111
#
# The 2D pattern begins at the second row and the third column of the grid. The pattern is said to be present in the grid.
#
# Function Description
#
# Complete the gridSearch function in the editor below. It should return YES if the pattern exists in the grid, or NO otherwise.
#
# gridSearch has the following parameter(s):
#
#     G: the grid to search, an array of strings
#     P: the pattern to search for, an array of strings
