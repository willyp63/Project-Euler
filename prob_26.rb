class UnitFraction
  attr_reader :denominator

  def initialize(denominator)
    @denominator = denominator
  end

  def cycle_length
    remainders = [1]
    until remainders.last == 0
      next_remainder = remainders.last * 10 % @denominator
      remainders.each_with_index do |remainder, index|
        if next_remainder == remainder
          return remainders.count - index
        end
      end
      remainders << next_remainder
    end
    0
  end
end

def longest_cycle(max_num)
  denominator = 0
  longest_cycle = 0
  (2).upto(max_num) do |num|
    cycle_length = UnitFraction.new(num).cycle_length
    if cycle_length > longest_cycle
      longest_cycle = cycle_length
      denominator = num
    end
  end
  denominator
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 26: #{longest_cycle(1000)}"
end
