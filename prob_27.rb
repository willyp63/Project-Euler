require './PrimeSeries'

def quadratic_primes
  ps = PrimeSeries.new(65)
  a_cos = ps.series.dup
  a_cos.unshift(1)
  a_cos.concat(a_cos.map {|n| n * -1})

  ps.get_primes_upto(1000)
  b_cos = ps.series.dup

  best_n = 0
  best_a = 0
  best_b = 0
  a_cos.each do |a|
    b_cos.each do |b|
      n = consecutive_primes(a, b, ps)
      if n > best_n
        best_n = n
        best_a = a
        best_b = b
      end
    end
  end

  best_a * best_b
end

def consecutive_primes(a, b, ps)
  n = 0
  while ps.prime?((n * n) + (a * n) + b)
    n += 1
  end
  n
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 27: #{quadratic_primes}"
end
