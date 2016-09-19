def largest_palindrome_product
  largest_palindrome = 0

  100.upto(999) do |num_1|
    num_1.upto(999) do |num_2|
      product = num_1 * num_2

      if product.palindrome? && product > largest_palindrome
        largest_palindrome = product
      end
    end
  end
  largest_palindrome
end

class Integer
  def palindrome?
    to_s.reverse == to_s
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 4: #{largest_palindrome_product}"
end
