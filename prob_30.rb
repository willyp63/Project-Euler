DIGIT_FIFTHS = Array.new(10) {|index| index ** 5}

def digit_fifth_powers
  max = DIGIT_FIFTHS[9] * 6 # 7 digit numbers not possible
  min = DIGIT_FIFTHS[2]

  sum = 0
  min.upto(max) do |number|
    sum += number if digit_fifth_sum(number) == number
  end
  sum
end

def digit_fifth_sum(number)
  digits = number.to_s.chars.map(&:to_i)
  digits.inject(0) {|sum, digit| sum + DIGIT_FIFTHS[digit]}
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 30: #{digit_fifth_powers}"
end
