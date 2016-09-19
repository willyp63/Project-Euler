def one_hundred_factorial
  (1..100).inject(&:*)
end

class Bignum
  def digits
    self.to_s.chars.map {|char| char.to_i}
  end

  def sum_of_digits
    self.digits.inject(&:+)
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 20: #{one_hundred_factorial.sum_of_digits}"
end
