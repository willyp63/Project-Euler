class Integer
  def num_digits
    self.to_s.length
  end
end

def first_thousand_digit_fib_idx
  last_fib = 0
  fib = 1
  idx = 1
  until fib.num_digits >= 1000
    temp = fib
    fib += last_fib
    last_fib = temp
    idx += 1
  end
  idx
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 25: #{first_thousand_digit_fib_idx}"
end
