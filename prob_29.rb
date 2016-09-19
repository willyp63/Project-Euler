BASE_REDUCTION = {
  4 => [2, 2],
  8 => [2, 3],
  9 => [3, 2],
  16 => [2, 4],
  25 => [5, 2],
  27 => [3, 3],
  32 => [2, 5],
  36 => [6, 2],
  49 => [7, 2],
  64 => [2, 6],
  81 => [9, 2],
  100 => [10, 2]
}

# UNFINISHED! (DOESN'T PRODUCE CORRECT ANSWER)

def distinct_powers
  dup_powers = 0
  BASE_REDUCTION.each do |base, reduction|
    dups = (100 / reduction.last) - 1
    puts dups
    dup_powers += dups
  end
  99 * 99 - dup_powers
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 29: #{distinct_powers}"
end
