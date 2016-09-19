require './PrimeSeries'

def largest_prime_factor
  num = 600851475143

  #get all possible prime factors
  primes = PrimeSeries.new(Math.sqrt(num)).series

  primes.each do |prime|
    #divide by all prime factors
    while num % prime == 0
      num /= prime
    end

    #return last prime factor
    return prime if num == 1
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 3: #{largest_prime_factor}"
end
