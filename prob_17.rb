ONE_TO_NINETEEN = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine",
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

TENS = {
  20 => "twenty",
  30 => "thirty",
  40 => "forty",
  50 => "fifty",
  60 => "sixty",
  70 => "seventy",
  80 => "eighty",
  90 => "ninety"
}

def number_letter_counts
  (1..1000).inject(0) do |num_letters, num|
    num_letters + num.num_letters
  end
end

class Fixnum
  def num_letters
    self.in_words.chars.inject(0) do |num_letters, char|
      char == " " ? num_letters : num_letters + 1
    end
  end

  def in_words
    if self <= 19
      ONE_TO_NINETEEN[self]
    elsif self <= 99
      words = TENS[(self / 10) * 10]
      if self % 10 != 0
        words + " " + ONE_TO_NINETEEN[self % 10]
      else
        words
      end
    elsif self <= 999
      words = (self / 100).in_words + " hundred"
      if self % 100 != 0
        words + " and " + (self % 100).in_words
      else
        words
      end
    else
      "one thousand"
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 17: #{number_letter_counts}"
end
