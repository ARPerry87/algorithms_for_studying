def solution(a)
  return 0 if a.length < 2

  max_profit = 0
  min_price = a[0]

  a.each do |price|
    min_price = [min_price, price].min
    max_profit = [max_profit, price - min_price].max
  end

  max_profit
end

#can also be done this way

def solution(a)
  days = a.length

  return 0 if days < 2

  max_profit = 0
  max_price_from_here = a[days - 1]

  (days - 2).downto(0) do |i|
    max_profit = [max_profit, max_price_from_here - a[i]].max
    max_price_from_here = [max_price_from_here, a[i]].max
  end
  return max_profit
end

# lets see if we can make it faster

def solution(a)
  days = a.length

  return 0 if days < 2

  max_profit = 0
  min_price = a[0]

  (1...days).each do |i|
    max_profit = [max_profit, a[i] - min_price].max
    min_price = [min_price, a[i]].min
  end
  max_profit
end