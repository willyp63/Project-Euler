require 'date'

def sundays_on_first
  sundays_on_first = 0
  date = Date.new(1901, 1, 1) #jan 1st 1901
  while date.year <= 2000
    sundays_on_first += 1 if date.sunday?
    date = date >> 1 #go to first of next month
  end
  sundays_on_first
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 19: #{sundays_on_first}"
end
