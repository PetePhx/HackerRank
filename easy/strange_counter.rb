def strange_counter(t)
  counter_size = 3
  rem = t
  while rem > counter_size
    rem -= counter_size
    counter_size *= 2
  end
  counter_size - rem + 1
end

p strange_counter(2) # 2
p strange_counter(3) # 1
p strange_counter(4) # 6
p strange_counter(9) # 1
p strange_counter(10) # 12
p strange_counter(12) # 10
p strange_counter(21) # 1

# Problem:
# Bob has a strange counter. At the first second, it displays the number 3. Each second, the number displayed by the counter decrements by 1 until it reaches 1. The counter counts down in cycles. In next second, the timer resets to 2 times the initial number for the previous cycle and continues counting down.
#
# Find and print the value displayed by the counter at time t.
