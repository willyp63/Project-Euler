class Fixnum
  def sum_divisors
    sum = 0
    (1...self).each do |divisor|
      sum += divisor if self % divisor == 0
    end
    sum
  end
end

def sum_of_amicable_numbers(max_num)
  sum = 0
  (1...max_num).each do |num|
    sum_divisors = num.sum_divisors
    if num < sum_divisors && num == sum_divisors.sum_divisors
      sum += num + sum_divisors # add pair
    end
  end
  sum
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 20: #{sum_of_amicable_numbers(10_000)}"
end
