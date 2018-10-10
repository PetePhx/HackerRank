def beautiful_pairs(arr1, arr2)
  dbs_size = arr1.uniq
                 .map { |elm| [arr1.count(elm), arr2.count(elm)].min }
                 .sum
  dbs_size == arr1.size ? [dbs_size - 1, 0].max : dbs_size + 1
end

p beautiful_pairs([1, 2, 3, 4], [1, 2, 3, 3]) # 4
p beautiful_pairs([1, 2, 3, 4], [1, 2, 3, 4]) # 3 since
p beautiful_pairs([1, 2, 3, 4], [5, 6, 7, 8]) # 1
p beautiful_pairs([0, 0, 0, 1], [0, 1, 1, 1]) # 3
p beautiful_pairs([0, 0, 0, 0], [1, 1, 1, 1]) # 1
p beautiful_pairs([], []) # 0
p beautiful_pairs([1], [1]) # 0

=begin
General Approach:
  - The size of the beautiful set is the number of edges made from connecting the
  elements of A to equal elements in B

  - for the disjoint beautiful set (DBS), the edges should be disjoined: no vertex should belong to more than one edge.

  - The size of the DBS:
    - for each distinct element of A:
      - count occurances in A, occurances in B, find minumum of the two
    - sum the above counts

  - The DBS size can be increased by 1 if
    - if the DBS size in less than the array length
    - otherwise it will decrease by 1
  end
=end

=begin
arrays A, B, each having n elements

A "beautiful" set { (i, j) where A[i] == B[j] } ( if & only if )

A pairwise disjoint beautiful set:
  for each (i,j) and (k,l) in the set: i != k and j != l

Output: Determine and print the maximum possible number of pairwise disjoint beautiful pairs.
=end

# problem:
# Your task is to change _exactly_ one element in B (the second array) so that the size of the pairwise disjoint beautiful set is maximum.
