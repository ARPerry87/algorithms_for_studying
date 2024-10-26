# Leetcode link: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
# Problem: You are given an array prices where prices[i] is the price of a given stock on the ith day.
# You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
# Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
 
# Solution:

def max_profit(prices)
  # we need to use two pointer for this problem
   #we create a variable to store the minimum price 
   #we create a variable to store the maximum profit
   #we iterate through the array
   #we check if the current price is less than the minimum price
   #if it is we update the minimum price
   #if it isn't we check if the difference between the current price and the minimum price is greater than the maximum profit
   #if it is we update the maximum profit
   #we then return the maximum profit
   
   min_price = Float::INFINITY # our left pointer
   max_profit = 0 # our right pointer
     prices.each do |p|
       if p < min_price
          min_price = p
       elsif p - min_price > max_profit
          max_profit = p - min_price
       else 
          max_profit
       end
     end
      max_profit
end

# different solution 

def max_profit(prices)
  l, r = 0, 1
  max_profit = 0

  while r < prices.length
    if prices[l] < prices[r]
      profit = prices[r] - prices[l]
      max_profit = [max_profit, profit].max
    else 
      l = r
    end
    r += 1
  end
  return max_profit
end