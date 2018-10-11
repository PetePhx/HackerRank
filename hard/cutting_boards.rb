def board_cutting(cost_y, cost_x)
  arr1, arr2 = [cost_y.sort, cost_x.sort]
  cost = 0
  mults = [1, 1]

  while arr1.any? || arr2.any?
    if arr1.any? && (arr2.empty? || arr1.last >= arr2.last)
      cost += arr1.pop * mults[0]
      mults[1] += 1
    else
      cost += arr2.pop * mults[1]
      mults[0] += 1
    end
  end

  p cost % (10**9 + 7)
end

board_cutting([2], [1]) # 4
board_cutting([2, 1, 3, 1, 4], [4, 1, 2]) # 42

=begin
General Approach:
- sort the arrays cost_y and cost_x: arr1, and arr2
  - the final answer is independent of the permutation of the costs arrays
- initialize the cost to 0
- initialize the multipliers pair arrays to [1, 1]

  while (arr1 or arr2 not empty)
    if  !arr1.empty? && (arr2.empty? || arr1.last >= arr2.last)
      val = arr1.pop
      cost += val * multipliers[0] # vertical cut cost * number of vert. segments
      multipliers[1] += 1
    else
      val = arr2.pop
      cost += val * multipliers[1] # horizontal cut cost * number of horiz. segments
      multipliers[0] += 1
    end
  end

  return p(cost % (1E9 + 7))
=end

# Problem:
# Alice gives Bob a board composed of 1 x 1 wooden squares and asks him to find the minimum cost of breaking the board back down into its individual squares. To break the board down, Bob must make cuts along its horizontal and vertical lines.
#
# To reduce the board to squares, Bob makes horizontal and vertical cuts across the entire board. Each cut has a given cost, cost_y[i] or const_x[j] for each cut along a row or column across one board, so the cost of a cut must be multiplied by the number of segments it crosses. The cost of cutting the whole board down into 1 x 1 squares is the sum of the costs of each successive cut.
#
# Can you help Bob find the minimum cost? The number may be large, so print the value modulo 10^9 + 7.
