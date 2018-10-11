# non-recursive solution

def largest_permutation(k, arr)
  sz = arr.size
  arr_rev = sz.downto(1).to_a # arr_rev[idx] = sz - idx
  return arr_rev if k >= sz - 1

  pos_arr = Array.new(sz + 1, 0)
  arr.each_with_index { |elm, idx| pos_arr[elm] = idx } # caching indices
  idx = 0
  while k > 0 && idx < sz - 1
    if arr[idx] != arr_rev[idx]
      arr[pos_arr[arr_rev[idx]]] = arr[idx]
      pos_arr[arr[idx]] = pos_arr[arr_rev[idx]] # update pos_arr
      arr[idx] = arr_rev[idx]
      k -= 1
    end
    idx += 1
  end
  arr
end

p largest_permutation(1, [4, 2, 3, 5, 1]) # [5, 2, 3, 4, 1]
p largest_permutation(2, [4, 2, 3, 5, 1]) # [5, 4, 3, 2, 1]
p largest_permutation(4, [4, 2, 3, 5, 1]) # [5, 4, 3, 2, 1]
p largest_permutation(1, [1, 2]) # [2, 1]
p largest_permutation(80, [1] + (2..100).to_a.reverse)
largest_permutation(90000, [1] + (2..100000).to_a.reverse)


# recursive solution

# def largest_permutation(k, arr)
#   arr_rev = arr.sort.reverse
#   largest_perm_recur(k, arr, arr_rev)
# end
#
# def largest_perm_recur(k, arr, arr_rev)
#   return arr if k == 0 || arr.empty?
#   if arr.first == arr_rev.first
#     return [arr_rev.first] + largest_perm_recur(k, arr.drop(1), arr_rev.drop(1))
#   else
#     idx = arr.index(arr_rev.first)
#     return [arr_rev.first] +
#       largest_perm_recur(k - 1, arr[1..idx - 1].push(arr.first, *arr[idx + 1..-1]), arr_rev.drop(1))
#   end
# end


# Problem:
# You are given an unordered array of unique integers incrementing from 1. You can swap any two elements a limited number of times. Determine the largest lexicographical value array that can be created by executing no more than the limited number of swaps.
