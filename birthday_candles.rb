def birthday_candles(arr)
  return 0 if arr.empty?
  max_height = arr.max
  arr.count(max_height)
end

# single-pass solution
def birthday_candles(arr)
  return 0 if arr.empty?
  cur_max = arr.first
  max_count = 1
  arr.drop(1).each do |elm|
    case elm <=> cur_max
    when 1
      cur_max = elm
      max_count = 1
    when 0
      max_count += 1
    end
  end
  max_count
end


puts birthday_candles [2,3,1,3,0] # 2

# Problem:
# You are in charge of the cake for your niece's birthday and have decided the cake will have one candle for each year of her total age. When she blows out the candles, she’ll only be able to blow out the tallest ones. Your task is to find out how many candles she can successfully blow out.
#
# For example, if your niece is turning years old, and the cake will have candles of height , , , , she will be able to blow out candles successfully, since the tallest candles are of height and there are such candles.
#
# Function Description
#
# Complete the function birthdayCakeCandles in the editor below. It must return an integer representing the number of candles she can blow out.
#
# birthdayCakeCandles has the following parameter(s):
#
#     ar: an array of integers representing candle heights
#
# Input Format
#
# The first line contains a single integer, , denoting the number of candles on the cake.
# The second line contains space-separated integers, where each integer describes the height of candle
