require './PrimeSeries'

def sum_of_primes(n)
  primes = PrimeSeries.new(n).series
  primes.inject(0, :+)
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 10: #{sum_of_primes(2_000_000)}"
end
