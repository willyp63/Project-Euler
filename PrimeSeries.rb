class PrimeSeries
  attr_reader :series

  def initialize(max_num = 0)
    @series = []
    get_primes_upto(max_num)
  end

  def get_primes_upto(max_num)
    while series.empty? || series.last < max_num
      get_next_prime
    end

    series.pop unless series.last == max_num
  end

  def get_next_prime
    if series.count == 0
      series << 2
    elsif series.count == 1
      series << 3
    else
      possible_prime = series.last + 2
      until prime?(possible_prime)
        possible_prime += 2
      end
      series << possible_prime
    end

    series.last
  end

  def prime?(num)
    return false if num <= 1

    num_sqrt = Math.sqrt(num)
    
    series.each do |prime|
      return true if prime > num_sqrt
      return false if num % prime == 0
    end
  end
end
