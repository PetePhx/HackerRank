def luck_balance(k, contest_arr)
  luck_balance = 0
  imp_arr, unimp_arr = contest_arr.partition { |subarr| subarr.last == 1 }
  win_size = [imp_arr.size - k, 0].max

  imp_arr.map! { |subarr| subarr.first }.sort!

  luck_balance -= imp_arr.first(win_size).sum # important wins
  luck_balance += imp_arr.drop(win_size).sum  # important losses
  luck_balance += unimp_arr.map { |subarr| subarr.first }.sum # unimportants are all losses
  luck_balance
end

p luck_balance(3, [[5, 1], [1, 1], [4, 0]]) # 10
p luck_balance(2, [[5, 1], [1, 1], [4, 0]]) # 10
p luck_balance(1, [[5, 1], [1, 1], [4, 0]]) # 8
p luck_balance(0, [[5, 1], [1, 1], [4, 0]]) # -2

=begin
Approach
  - partition the contenst_arr to important, unimportant
  - sort the important contests by luck number
  - luck_balance init to 0
  - win_size is imp_arr.size - k
  - important.drop(win_size), add the luck values to luck balance
  - unimportant, add all the luck values to luck_balance
  - return luck_balance
=end


=begin
Problem
Lena is preparing for an important coding competition that is preceded by a number of sequential preliminary contests. She believes in "saving luck", and wants to check her theory. Each contest is described by two integers, and :

    L[i] is the amount of luck associated with a contest. If Lena wins the contest, her luck balance will decrease by ; if she loses it, her luck balance will increase by .
    T[i] denotes the contest's importance rating. It's equal to if the contest is important, and it's equal to if it's unimportant.

If Lena loses no more than k important contests, what is the maximum amount of luck she can have after competing in all the preliminary contests? This value may be negative.

For example, and:

Contest		L[i]	T[i]
1		5	1
2		1	1
3		4	0

If Lena loses all of the contests, her will be 10. Since she is allowed to lose 2 important contests, and there are only 2 important contests. She can lose all three contests to maximize her luck at 10. If k=1, she has to win at least 1 of the important contests. She would choose to win the lowest value important contest worth 1. Her final luck will be 9.

Function Description

Complete the luckBalance function in the editor below. It should return an integer that represents the maximum luck balance achievable.

luckBalance has the following parameter(s):

    k: the number of important contests Lena can lose
    contests: a 2D array of integers where each contains two integers that represent the luck balance and importance of the contest.

Input Format

The first line contains two space-separated integers and , the number of preliminary contests and the maximum number of important contests Lena can lose.
Each of the next lines contains two space-separated integers, and , the contest's luck balance and its importance rating.

Constraints

Output Format

Print a single integer denoting the maximum amount of luck Lena can have after all the contests.

Sample Input

6 3
5 1
2 1
1 1
8 1
10 0
5 0

Sample Output

29

=end
