COINS = [2, 5, 10, 20, 50, 100, 200]

def combinations(total_pence, max_coin)
  return (total_pence / 2) + 1 if max_coin == 2
  return 1 if total_pence == 0

  next_coin = COINS[COINS.index(max_coin) - 1]

  combinations = 0
  0.upto(total_pence / max_coin) do |num_coins|
    remaining_pence = total_pence - (max_coin * num_coins)
    combinations += combinations(remaining_pence, next_coin)
  end
  combinations
end

if $PROGRAM_NAME == __FILE__
  puts "Problem 31: #{combinations(200, COINS.last)}"
end
