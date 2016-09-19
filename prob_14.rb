def longest_chain
  longest_num = 0
  longest_length = 0
  500000.upto(1000000) do |num|
    length = chain_length(num)
    if length > longest_length
      longest_num = num
      longest_length = length
    end
  end
  longest_num
end

def chain_length(num)
  length = 0
  until num == 1
    if num % 2 == 0
      num /= 2
    else
      num = num * 3 + 1
    end
    length += 1
  end
  length
end
