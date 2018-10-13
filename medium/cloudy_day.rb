def maximum_people(pop, x, y, r)
  city_0_cld = []
  city_1_cld = []

  (0...x.size).each do |i|
    count = 0
    cloud_idx = nil
    (0...y.size).each do |j|
      if (x[i] - y[j]).abs <= r[j]
        count += 1
        cloud_idx = j
      end
      break if count > 1       # not interested in cities with more than 1 cloud
    end
    count == 0 ? city_0_cld << i : (city_1_cld << [i, cloud_idx] if count == 1)
  end
  pop_0_cld = city_0_cld.map { |i| pop[i] }.sum     # population of sunny cities
  pop_1_cld = city_1_cld.map { |i, j| [pop[i], j] } # popluation of single cloud cities
  candidate_pop = if pop_1_cld.empty?
                    0
                  else
                    pop_1_cld.group_by { |_, j| j }   # group by cloud index
                             .transform_values { |arr| arr.map(&:first).sum } # sum the population
                             .max_by { |_, v| v } # select the largest population
                             .last                # discard the key keep the value
                  end
  pop_0_cld + candidate_pop
end

p maximum_people([10, 100], [5, 100], [4], [1]) # 110

p maximum_people([10, 1, 8, 3], [4, 5, 7, 2], [3, 9, 3, 5], [11, 10, 8, 7]) # 0

# slower solution

# def maximum_people(pop, x, y, r)
#   matrix = x.map do |x_i|
#     y.map.with_index { |y_j, j| ((y_j - r[j])..(y_j + r[j])).include?(x_i) ? 1 : 0 }
#   end
#
#   population_no_cloud = pop.values_at(*(0...x.size).select { |i| matrix[i].sum == 0 }).sum
#   cities_one_cloud = (0...x.size).select { |i| matrix[i].sum == 1 }
#
#   cloud_single_coverage = matrix.transpose.map do |cloud| # populations under one cloud
#     cloud.map.with_index { |cov, idx| cities_one_cloud.include?(idx) ? (cov * pop[idx]) : 0 }.sum
#   end
#
#   return cloud_single_coverage.max + population_no_cloud
# end


# Problem:
#
# All year round, the city is covered in clouds. The city has many towns, located on a one-dimensional line. The positions and populations of each town on the number line are known to you. Every cloud covers all towns located at a certain distance from it. A town is said to be in darkness if there exists at least one cloud such that the town is within the cloud's range. Otherwise, it is said to be sunny.
#
# The city council has determined that they have enough money to remove exactly one cloud using their latest technology. Thus they want to remove the cloud such that the fewest number of people are left in darkness after the cloud is removed. What is the maximum number of people that will be in a sunny town after removing exactly one cloud?
#
# Note: If a town is not covered by any clouds, then it is already considered to be sunny, and the population of this town must also be included in the final answer.
#
# Complete the function maximumPeople which takes four arrays representing the populations of each town, locations of the towns, locations of the clouds, and the extents of coverage of the clouds respectively, and returns the maximum number of people that will be in a sunny town after removing exactly one cloud.
