def digit_cancelling_fractions
  numerators, denominators = [], []
  11.upto(99) do |numerator|
    (numerator + 1).upto(99) do |denominator|
      if cancel?(numerator, denominator)
        numerators << numerator
        denominators << denominator
      end
    end
  end

  numerator_product = numerators.inject(&:*)
  denominator_product = denominators.inject(&:*)

  #get reduced fraction'S denominator
  Rational(numerator_product, denominator_product).denominator
end

def cancel?(numerator, denominator)
  numerator_tens = numerator / 10
  numerator_ones = numerator % 10
  denominator_tens = denominator / 10
  denominator_ones = denominator % 10

  if numerator_ones == denominator_tens
    if numerator.fdiv(denominator) == numerator_tens.fdiv(denominator_ones)
      return true
    end
  elsif numerator_tens == denominator_ones
    if numerator.fdiv(denominator) == numerator_ones.fdiv(denominator_tens)
      return true
    end
  end

  false
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 33: #{digit_cancelling_fractions}"
end
