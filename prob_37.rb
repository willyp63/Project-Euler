require './PrimeSeries'

def truncatable_primes
  prime_series = PrimeSeries.new
  truncatable_primes = []
  until truncatable_primes.count == 11 #only 11 exist
    next_prime = prime_series.get_next_prime
    if next_prime.truncatable_prime?(prime_series)
      truncatable_primes << next_prime
    end
  end
  truncatable_primes.inject(&:+)
end

class Fixnum
  def truncatable_prime?(prime_series)
    return false if self.to_s.length <= 1
    truncations.all? {|trunc| prime_series.prime?(trunc)}
  end

  private
  def truncations
    truncations = []
    str = self.to_s
    (1).upto(str.length - 1) do |pos|
      truncations << str[pos..-1].to_i
      truncations << str[0..pos - 1].to_i
    end
    truncations
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 37: #{truncatable_primes}"
end
