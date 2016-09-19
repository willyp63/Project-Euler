require './PrimeSeries'

def special_triangle
  prime_series = PrimeSeries.new

  base_length = 1
  triangle = 1
  until num_factors(triangle, prime_series) > 500
    base_length += 1
    triangle += base_length
  end
  triangle
end

def num_factors(num, prime_series)
  num_factors = 1
  prime_idx = 0
  while num > 1
    until prime_series.series.count > prime_idx
      prime_series.get_next_prime
    end

    num_divisions = 1
    prime = prime_series.series[prime_idx]
    while num % prime == 0
      num /= prime
      num_divisions += 1
    end
    num_factors *= num_divisions
    prime_idx += 1
  end
  num_factors
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 12: #{special_triangle}"
end
