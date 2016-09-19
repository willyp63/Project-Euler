def power_sum
  two_power_one_thousand = 2**1000
  digits = two_power_one_thousand.to_s.chars.map(&:to_i)
  digits.inject(:+)
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 16: #{power_sum}"
end
