def reverse_shuffle_merge(str)
  arr = str.chars
  str_chars = arr.sort.select.with_index { |c, idx| idx.even? } # remove duplicates
  out_arr = []
  idx = 0
  min_pos = 0

  while str_chars.size > 0
    idx = find_index_containing(arr, str_chars) if min_pos <= idx
    min_char = (arr[idx..-1] & str_chars).min
    min_pos = arr.rindex(min_char)
    str_chars.delete_at(str_chars.index(min_char)) # remove one instance
    out_arr << min_char                            # add once instance
    arr.slice!(min_pos..-1)                        # truncate
  end

  out_arr.join('')
end

def find_index_containing(arr1, arr2)
  (arr2.size - 1 .. arr1.size - 1).each do |idx|
    return idx if arr2.all? { |e| arr1[0..idx].count(e) >= arr2.count(e) }
  end
end

# def index_containing?(idx, arr1, arr2)
#   arr2.all? { |e| arr1[0..idx].count(e) >= arr2.count(e) }
# end

# p find_index_containing([1, 2, 3], [1, 2, 3]) # 2
# p find_index_containing([1, 2, 3, 1, 2, 3], [1, 2, 3]) # 2
# p find_index_containing([3, 2, 3, 1], [1, 2, 3]) # 3
# p find_index_containing([1, 1, 1, 2, 2, 2, 3, 3, 3], [1, 2, 3]) # 6

p reverse_shuffle_merge('abababab') # 'aabb'
p reverse_shuffle_merge('abab') # 'ab'
p reverse_shuffle_merge('eggegg') # 'egg'
p reverse_shuffle_merge('abcdefgabcdefg') # 'agfedcb'
p reverse_shuffle_merge('aeiouuoiea') # 'aeiou'
p reverse_shuffle_merge('bdabaceadaedaaaeaecdeadababdbeaeeacacaba') # 'aaaaaabaaceededecbdb'
p reverse_shuffle_merge('sbcnzxqnrygkocahxjebvueaawwcythjdrhvizqsshgtwdolmillxpshxpxqrywkivceufclhydhshrklkphajbftuapiocjlcthfirhgaohfysqjolssbzhbovdstbyqdpnjbpfmgqrzfctcwcrztvgbegunarvecseoulabaonguckqbtrvuagreyclyjytpvozqdnhldlnsocenuzksawirgsbjobpldjdlrxbricrauuksbmecvvwagnnacaqghmjpzrlsvlpbbcuaddgvlhvuvkxexjcfhxrodmcwlrzyyiksuksshhonahsyzbbprwuitmoyoqurtqsaslevgvpfbzkkhgcnpjdpseuiylluvdetsqssbrxpiclxxvosuqipsqvvwsezhl')
# 'aaaaaavvcembskuuabxddlpbbsgiascosdlhndqzovpjlcyerauvrbkcugnbluescevrnubgvtzrcwccfzrqgmfpbjnpdqybtsdvobhzsslojqsyfhoghrifhtclcoiputjhpklkrhsdyhlcuevikwyrqxpxhspxllimlowtghssqzivhrjtywweuvejxokgyrnqxzns'



=begin

General Approach:
- get the set of characters in str, sort it, select one in each pair. (str_chars).
- out_arr = []

while str_chars not empty do
  - find the first str index (idx) that containst all str_chars behind it
    - str_chars.all { |ch| str[0..idx].count(ch) >= str_chars.count(ch) }

  - find the minimum character in str[idx..-1] intersection str_chars (min_char)

  - remove one instance of min_char from str_chars
  - add one instance of min_char to out_arr
  - truncate the str at the last occurence of min_char
    - str = str[0... str.rindex(min_char)]

end
- return out_arr.join('')

=end



# Problem:
# Given a string s such that s is a member of
#
#   MERGE( REVERSE(A), SHUFFLE(A) )
#
# for some string A, find the lexicographically smallest A.
#
# MERGE denotes any string that's obtained by interspersing the two strings, maintaining the order of characters in both.
#
# REVERSE denotes the reverse of a string
#
# SHUFFLE denotes any string that's a permutation of the original string
#
# For example, s = abab. We can split it into two strings of ab. The reverse is ba and we need to find a string to shuffle in to get abab. The middle two characters match our reverse string, leaving the a and b at the ends. Our shuffle string needs to be ab. Lexicographically ab < ba, so our answer is ab.
