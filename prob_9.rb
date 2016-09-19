def special_triplet
  1.upto(500) do |a|
    a.upto(500) do |b|
      if a**2 + b**2 == (a + b - 1000)**2
        return a * b * (1000 - a - b)
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 9: #{special_triplet}"
end
