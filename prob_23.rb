class Fixnum
  def abundant?
    self.sum_divisors > self
  end

  def sum_divisors
    return 0 if self <= 1
    sum = 1 # 1 is always a divisor
    sqrt = Math.sqrt(self)
    divisor = 2
    while divisor < sqrt
      if self % divisor == 0
        sum += divisor
        sum += self / divisor #add other divisor > sqrt
      end
      divisor += 1
    end
    #add only divisor if its the sqrt
    if divisor == sqrt
      sum += divisor
    end
    sum
  end
end

def abundants(max_num)
  (1..max_num).select(&:abundant?)
end

def abundant_sums_table(max_num)
  abundants = abundants(max_num - 12)
  table = Array.new(max_num + 1)
  0.upto(abundants.count - 2) do |idx_1|
    idx_1.upto(abundants.count - 1) do |idx_2|
      sum = abundants[idx_1] + abundants[idx_2]
      table[sum] = true
    end
  end
  table
end

def non_abundant_sum(max_num)
  table = abundant_sums_table(max_num)
  sum = 0
  1.upto(max_num) do |num|
    sum += num unless table[num]
  end
  sum
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 23: #{non_abundant_sum(28123)}"
end
