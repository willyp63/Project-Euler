def sum_of_squares(nums)
  nums.inject(0) {|sum, num| sum + (num * num)}
end

def square_of_sum(nums)
  sum = nums.inject(0, :+)
  sum * sum
end

def diff
  nums = (1..100).to_a
  square_of_sum(nums) - sum_of_squares(nums)
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 6: #{diff}"
end
