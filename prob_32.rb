def pandigital_sum
  multiplicands = (99..9999)
  multipliers = (1..99)

  products = []
  multipliers.each do |multiplier|
    multiplicands.each do |multiplicand|
      product = multiplier * multiplicand
      break if product > 9999

      if pandigital(multiplicand, multiplier, product)
        products << product
      end
    end
  end
  products.uniq.inject(&:+)
end

def pandigital(multiplicand, multiplier, product)
  digits = multiplicand.digits + multiplier.digits + product.digits
  return false if digits.count != 9 || digits.include?(0)
  return false if digits.uniq.count != 9
  true
end

class Integer
  def digits
    self.to_s.chars.map(&:to_i)
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 32: #{pandigital_sum}"
end
