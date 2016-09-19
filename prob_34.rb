# UNFINISHED! (DOESN'T PRODUCE CORRECT ANSWER)

def digit_factorials_sum
  sum = 0
  3.upto(145) do |num|
    if num.digit_factorial_sum == num
      sum += num
    end
  end
  sum
end

DIGIT_FACTORIALS = Array.new(10) do |idx|
  if idx == 0
    1
  else
    (1..idx).to_a.inject(&:*)
  end
end

class Integer
  def digit_factorial_sum
    digits.inject(0) {|sum, digit| sum + DIGIT_FACTORIALS[digit]}
  end

  private
  def digits
    self.to_s.chars.map(&:to_i)
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 34: #{digit_factorials_sum}"
end
