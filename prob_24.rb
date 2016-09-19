def nth_permutation(n, digits)
  return digits if digits.count <= 1 # no permutations

  remaining_digits = digits.count - 1
  remaining_permutations = (1..remaining_digits).inject(&:*)

  # get first digit and remove that digit
  first_digit_idx = (n - 1) / remaining_permutations
  first_digit = digits.delete_at(first_digit_idx)

  n = n % remaining_permutations # get n for remaining permutation

  # first digit + remaining nth permutation
  [first_digit].concat(nth_permutation(n, digits))
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 24: #{nth_permutation(1_000_000, (0..9).to_a).join.to_i}"
end
