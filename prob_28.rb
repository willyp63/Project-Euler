def number_spiral_diagonal_sum(n)
  spiral_size = 1
  spiral_last = 1
  sum = 1
  while spiral_size < n
    spiral_size += 2
    4.times do
      spiral_last += spiral_size - 1
      sum += spiral_last
    end
  end
  sum
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 28: #{number_spiral_diagonal_sum(1001)}"
end
