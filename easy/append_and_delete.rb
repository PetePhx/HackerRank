def append_delete(s, t, k)
  s_sz, t_sz = [s.size, t.size]
  overlap = (0...s_sz).find { |idx| s[idx] != t[idx] } || s_sz

  case (s_sz - t_sz - k).even? # parity preserved?
  when true # only the tail of s needs to be changed
    return k >= s_sz + t_sz - 2 * overlap ? p('Yes') : p('No')
  when false # all of s needs to be deleted and appended
    return k >= s_sz + t_sz ? p('Yes') : p('No')
  end
end

append_delete('hackerhappy', 'hackerrank', 9) # 'Yes'
append_delete('aba', 'aba', 7) # 'Yes'
append_delete('ashley', 'ash', 2) # 'No'

# Problem:
# You have a string of lowercase English alphabetic letters. You can perform two types of operations on the string:
#
#   1. Append a lowercase English alphabetic letter to the end of the string.
#
#   2. Delete the last character in the string. Performing this operation on an empty string results in an empty string.
#
# Given an integer, k, and two strings, s and t, determine whether or not you can convert s to t by performing exactly k of the above operations on s. If it's possible, print Yes. Otherwise, print No.
