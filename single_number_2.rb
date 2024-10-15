# Leetcode link: https://leetcode.com/problems/single-number-ii/
# Description: Given a non-empty array of integers, every element appears three times except for one, which appears exactly once. Find that single one.
# Note: Your algorithm should have a linear runtime complexity. Could you implement it without using extra memory?
# Example 1:
# Input: [2,2,3,2]
# Output: 3
# Example 2:
# Input: [0,1,0,1,0,1,99]
# Output: 99

# Solution:

# we want to use bitwise operations to solve this problem
# the idea is to iterate through the array and compare the values
# we want to set the ones variable to 0 and the twos variable to 0
# we want to iterate through the array and compare the values

def single_number(nums)
  ones = 0 # set the ones variable to 0
  twos = 0 # set the twos variable to 0

  nums.each do |n| # iterate through the array
    ones = (ones ^ n) & ~twos # set the ones variable to the xor of the ones variable and the current value and the not of the twos variable
    twos = (twos ^ n) & ~ones # set the twos variable to the xor of the twos variable and the current value and the not of the ones variable
  end
  ones
end