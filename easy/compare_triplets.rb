def compare_triplets(trp1, trp2)
  trp1.each_index.with_object([0, 0]) do |idx, obj|
    case trp1[idx] <=> trp2[idx]
      when 1 then obj[0] += 1
      when -1 then obj[1] += 1
    end
  end
end

# or

def compare_triplets(trp1, trp2)
  [(0..2).to_a.count { |i| trp1[i] > trp2[i] }, (0..2).to_a.count { |i| trp1[i] < trp2[i] }]
end

p compare_triplets([1, 2, 3], [3, 2, 1]);

# Alice and Bob each created one problem for HackerRank. A reviewer rates the two challenges, awarding points on a scale from to for three categories: problem clarity, originality, and difficulty.
#
# We define the rating for Alice's challenge to be the triplet , and the rating for Bob's challenge to be the triplet .
#
# Your task is to find their comparison points by comparing with , with , and with .
#
#     If , then Alice is awarded point.
#     If , then Bob is awarded point.
#     If , then neither person receives a point.
#
# Comparison points is the total points a person earned.
#
# Given and , determine their respective comparison points.
#
# For example, and . For elements , Bob is awarded a point because . For the equal elements and , no points are earned. Finally, for elements , so Alice receives a point. Your return array would be with Alice's score first and Bob's second.
#
# Function Description
#
# Complete the function compareTriplets in the editor below. It must return an array of two integers, the first being Alice's score and the second being Bob's.
#
# compareTriplets has the following parameter(s):
#
#     a: an array of integers representing Alice's challenge rating
#     b: an array of integers representing Bob's challenge rating
