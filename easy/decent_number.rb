def decent_number(n)
  0.step(to: n, by: 5) do |k|
    return (p "5" * (n - k) + "3" * k) if (n - k) % 3 == 0
  end
  return (p -1)
end

decent_number(4)
decent_number(1)
decent_number(3)
decent_number(5)
decent_number(11)

=begin
Approach:
  iterate through integers k: 0 to n / 5:
    - check whether n - k divisible by 3
      - if yes, return/print "5" * (n-k) + "3" * k
  return/print "-1"
=end


# Problem:
#
# A Decent Number has the following properties:
#
#     Its digits can only be 3's and/or 5's.
#     The number of 3's it contains is divisible by 5.
#     The number of 5's it contains is divisible by 3.
#     It is the largest such number for its length.
#
# Complete the decentNumber function in the editor below. It should print the decent number for the given length, or if a decent number of that length cannot be formed.
#
# decentNumber has the following parameter(s):
#
#     n: the integer length of the decent number to create
