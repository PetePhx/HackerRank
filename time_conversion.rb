def time_conversion(str)
  hr, mn, sc = str[0...-2].split(":").map(&:to_i)
  case str[-2..-1].upcase
  when 'AM' then hr = (hr == 12 ? 0 : hr)
  when 'PM' then hr = (hr == 12 ? hr : hr + 12)
  end
  format('%02d:%02d:%02d', hr, mn, sc)
end

puts time_conversion('07:05:45PM')
puts time_conversion('12:00:00AM')

=begin
Approach
  input: strnig: 12-hr format: '12:00:00AM'
  output: string: 24-hr format: '00:00:00'

  edge cases:
    - 12AM becomes 00

  Algorithm
    - newstr initialized as str[0...-2] i.e. without AM/PM
    - ampm = str[-2..-1].upcase
    - hr, mn, sc = newstr.split(":").map(&:to_i)
    -case ampm
  when 'AM'
    hr = (hr == 12 ? 0 : hr)
  when 'PM'
    hr = (hr == 12 ? hr : hr + 12)

    -outstr = format('%02d:%02d:%02d', hr, mn, sc)
    return ^
=end


# Problem:
# Given a time in 12-hour AM/PM format, convert it to military (24-hour) time.
#
# Note: Midnight is 12:00:00AM on a 12-hour clock, and 00:00:00 on a 24-hour clock. Noon is 12:00:00PM on a 12-hour clock, and 12:00:00 on a 24-hour clock.
#
# Function Description
#
# Complete the timeConversion function in the editor below. It should return a new string representing the input time in 24 hour format.
#
# timeConversion has the following parameter(s):
#
#     s: a string representing time in hour format
#
# Input Format
#
# A single string containing a time in -hour clock format (i.e.: or ), where and .
#
# Constraints
#
#     All input times are valid
#
# Output Format
#
# Convert and print the given time in -hour format, where .
#
# Sample Input 0
#
# 07:05:45PM
#
# Sample Output 0
#
# 19:05:45
#
