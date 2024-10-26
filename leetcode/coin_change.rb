# Leetcode link: https://leetcode.com/problems/coin-change/
# Description: You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.
# Example 1:
# Input: coins = [1, 2, 5], amount = 11
# Output: 3
# Explanation: 11 = 5 + 5 + 1
# Example 2:
# Input: coins = [2], amount = 3
# Output: -1
# Note: You may assume that you have an infinite number of each kind of coin.

# Solution:

def coin_change(coins, amount)
  dp = Array.new(amount + 1, amount + 1)
  dp[0] = 0

  coins.each do |coin|
      (coin..amount).each do |i|
          dp[i] = [dp[i], dp[i - coin] + 1].min
      end
  end

  dp[amount] > amount ? -1 : dp[amount]
end