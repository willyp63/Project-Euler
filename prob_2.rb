def even_fibonacci_numbers
  sum = 0

  last_fib = 1
  fib = 1
  while fib < 4000000
    sum += fib if fib % 2 == 0

    last_fib, fib = fib, fib + last_fib
  end
  sum
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 2: #{even_fibonacci_numbers}"
end
