require './PrimeSeries'

def nth_prime(n)
  prime_series = PrimeSeries.new
  n.times {prime_series.get_next_prime}
  prime_series.series.last
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 7: #{nth_prime(10_001)}"
end
