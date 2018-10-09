def mini_max_sum(arr)
  arrmin, arrmax, arrsum = [arr.min, arr.max, arr.sum]
  puts("#{arrsum - arrmax} #{arrsum - arrmin}")
  [arrsum - arrmax, arrsum - arrmin]
end

mini_max_sum([1, 2, 3, 4, 5]) # 10 14


# Problem:
# Given five positive integers, find the minimum and maximum values that can be calculated by summing exactly four of the five integers. Then print the respective minimum and maximum values as a single line of two space-separated long integers.
