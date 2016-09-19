require './PrimeSeries'

def smallest_multiple
  primes = PrimeSeries.new(20).series

  shared_factors = []
  2.upto(20) do |num|
    num_factors = prime_factors(num, primes)
    shared_factors = distinct_factors(shared_factors, num_factors)
  end

  shared_factors.inject(1, :*)
end

def distinct_factors(factors_1, factors_2)
  distinct_factors = []
  until factors_1.empty? && factors_2.empty?
    #get smallest factor
    prime = factors_1.first || factors_2.first

    #get num factors for each list
    num_factors_1 = factors_1.rindex(prime) || -1
    num_factors_2 = factors_2.rindex(prime) || -1

    #remove factors
    factors_1 = factors_1[(num_factors_1 + 1)..-1]
    factors_2 = factors_2[(num_factors_2 + 1)..-1]

    #add max num factors to distinct list
    factors = Array.new([num_factors_1, num_factors_2].max + 1, prime)
    distinct_factors.concat(factors)
  end
  distinct_factors
end

def prime_factors(num, primes)
  factors = []
  primes.each do |prime|
    while num % prime == 0
      factors << prime
      num /= prime
    end

    break if num == 1
  end
  factors
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 5: #{smallest_multiple}"
end
