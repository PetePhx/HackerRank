def pylons(k, arr)
  sz = arr.size
  plant_count = 0
  city_pos = plant_pos = 0 # positions
  while city_pos < sz
    possible_pos = ([0, city_pos - k + 1].max..city_pos + k - 1).select { |pos| arr[pos] == 1 }
    return -1 if possible_pos.empty?
    plant_pos = possible_pos.max
    plant_count += 1
    city_pos = plant_pos + k # can't reach this one
  end
  plant_count
end

p pylons(2, [0, 1, 1, 1, 1, 0]) # 2
p pylons(3, [0, 1, 1, 1, 0, 0, 0]) # -1

p pylons(5, [1, 0, 1, 0, 0, 0, 0, 0, 0, 1] ) # 2

p pylons(20, [0]*10 + ([1] + [0]*37)*10 + [1]) # 11

=begin
General Approach:
  - intialize the plants number to 0
  - loop:
    - find the farthest power plant that can be built for each idx location
      - (k - 1) units away on both sides
      - return p -1 if not possible
    - once the power plant location is found (idx), add one to plants
    - find the first city that can not be reach by the plant (k away)
=end

# Problem:
# Goodland is a country with a number of evenly spaced cities along a line. The distance between adjacent cities is 1 unit. There is an energy infrastructure project planning meeting, and the government needs to know the fewest number of power plants needed to provide electricity to the entire list of cities. Determine that number. If it cannot be done, return -1.
#
# You are given a list of city data. Cities that may contain a power plant have been labeled 1. Others not suitable for building a plant are labeled 0. Given a distribution range of k, find the lowest number of plants that must be built such that all cities are served. The distribution range limits supply to cities where distance is less than k.
#
# Print a single integer denoting the minimum number of plants that must be built so that all of Goodland's cities have electricity. If this is not possible for the given value of k, print -1.
