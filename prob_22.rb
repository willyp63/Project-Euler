def name_scores
  sum = 0
  names.sort!.each_with_index do |name, index|
    sum += name_score(name, index + 1)
  end
  sum
end

def names
  names = File.read("./p22_names.txt")
  names = names[1..-2] #remove first and last "
  names.split(%Q(","))
end

def name_score(name, index)
  name.chars.inject(0) {|score, char| score + char_score(char)} * index
end

def char_score(char)
  char.ord - 'A'.ord + 1
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 22: #{name_scores}"
end
