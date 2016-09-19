def multiples_of_three_and_five
  multiples = multiples_of(3, 1000) + multiples_of(5, 1000)
  multiples.uniq.inject(0, :+)
end

def multiples_of(number, max_multiple)
  num_multiples = (max_multiple - 1) / number
  Array.new(num_multiples) {|i| (i + 1) * number}
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 1: #{multiples_of_three_and_five}"
end
