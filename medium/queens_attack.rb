def queen_attack(n, k, r_q, c_q, obst_arr)
  pos_arr = []
  closest_obst = {}
  obst_arr.each do |r_o, c_o|
    next if !on_the_path?(r_o, c_o, r_q, c_q)
    dirc = find_direction(r_o, c_o, r_q, c_q)
    dist = [(r_o - r_q).abs, (c_o - c_q).abs].max
    closest_obst[dirc] = dist if closest_obst[dirc].nil? || dist < closest_obst[dirc]
  end

  squares = 0
  (-3..4).each do |dirc|
    if !closest_obst[dirc].nil?
      squares += closest_obst[dirc] - 1
    else
      squares += dist_to_boundary(r_q, c_q, dirc, n)
    end
  end
  squares
end

def on_the_path?(r_o, c_o, r_q, c_q)
  (r_q - r_o).zero? || (c_q - c_o).zero? || (r_o - r_q).abs == (c_o - c_q).abs
end

# p on_the_path(1, 1, 2, 2) # true
# p on_the_path(1, 1, 1, 3) # true
# p on_the_path(1, 1, 2, 3) # false

def find_direction(r_o, c_o, r_q, c_q)
  (Complex(c_o - c_q, r_o - r_q).phase / Math::PI * 4).round
end

# directions:
#
#             2
#          3     1
#       4     .     0
#        -3     -1
#            -2


# p direction(1, 2, 1, 1) # 0
# p direction(2, 1, 1, 1) # 2
# p direction(1, 1, 2, 1) # -2

def dist_to_boundary(r_q, c_q, dirc, n)
  case dirc
  when -3 then [c_q - 1, r_q - 1].min
  when -2 then r_q - 1
  when -1 then [n - c_q, r_q - 1].min
  when  0 then n - c_q
  when  1 then [n - c_q, n - r_q].min
  when  2 then n - r_q
  when  3 then [c_q - 1, n - r_q].min
  when  4 then c_q - 1
  end
end

# | . . . . |
# | . . . . |
# | . o . . |
# | . . . . |

# p dist_to_boundary(2, 2, 0, 4) # 2
# p dist_to_boundary(2, 2, 1, 4) # 2
# p dist_to_boundary(2, 2, 2, 4) # 2
# p dist_to_boundary(2, 2, 3, 4) # 1
# p dist_to_boundary(2, 2, 4, 4) # 1
# p dist_to_boundary(2, 2, -3, 4) # 1
# p dist_to_boundary(2, 2, -2, 4) # 1
# p dist_to_boundary(2, 2, -1, 4) # 1

p queen_attack(4, 0, 4, 4, []) #9
p queen_attack(5, 3, 4, 3, [[5, 5], [4, 2], [2, 3]]) #10
p queen_attack(1, 0, 1, 1, []) #0


=begin
Algorithm:
  - initialize positions array: pos_arr = []
  - iterate through the obtacles. for each obstacle
    - determine if it is on the path of the queen
      - r_o == r_q || c_o == c_q || (r_o - r_q).abs == (c_o - c_q).abs
    - if it is on the path:
      - determine which of the 8 directions:
        1: r_o == r_q and c_o > c_q
        2: ...
        8: r_o - r_q == -(c_o - c_q) and c_o > c_q
      - determine the distance to the queen
        [(r_o - r_q).abs, (c_o - c_q).abs].max

      - pos_arr << [direction, distance]

  - group pos_arr by direction, in each direction find obtacle with min distance

  - sum squares in each of the 8 directions
    - for directions with no obstacle: distance to the boundary
    - for directions with obstacles: obstacle distance - 1
=end

# Problem:
# You will be given a square chess board with one queen and a number of obstacles placed on it. Determine how many squares the queen can attack.
#
# A queen is standing on an n x n chessboard. The chess board's rows are numbered from 1 to n, going from bottom to top. Its columns are numbered from 1 to n, going from left to right. Each square is referenced by a tuple, (r, c), describing the row, r , and column, c, where the square is located. There are obstacles on the chessboard, each preventing the queen from attacking any square beyond it on that path.
