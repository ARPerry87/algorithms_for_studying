# Leetcode link: https://leetcode.com/problems/house-robber/
# Description: You are a professional robber planning to rob
# houses along a street. Each house has a certain amount of
# money stashed, the only constraint stopping you from robbing
# each of them is that adjacent houses have security system
# connected and it will automatically contact the police if
# two adjacent houses were broken into on the same night.
# Given a list of non-negative integers representing the amount
# of money of each house, determine the maximum amount of money
# you can rob

# Solution:

# we want to use dynamic programming to solve this problem

# the idea is to create an array of the same size as the input array and set the first two values to the first two values of the input array

def rob(nums)
  rob1, rob2 = 0,0

  nums.each do |n|
    # we want to set the temp variable to the maximum of the first value plus the current value and the second value
    temp = [rob1 + n, rob2].max
    rob1 = rob2
    rob2 = temp
  end
  rob2
end

# or using dynamic programming

def rob(nums)
  return 0 if nums.empty?
  return nums[0] if nums.size == 1
  dp = Array.new(nums.size, 0)
  dp[0] = nums[0]
  dp[1] = [nums[0], nums[1]].max
  (2...nums.size).each do |i|
    dp[i] = [dp[i - 2] + nums[i], dp[i - 1]].max
  end
  dp.last
end