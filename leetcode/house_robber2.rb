# Leetcode link: https://leetcode.com/problems/house-robber-ii/
# Description: You are a professional robber planning to rob
# houses along a street. Each house has a certain amount of
# money stashed, the only constraint stopping you from robbing
# each of them is that adjacent houses have security system
# connected and it will automatically contact the police if
# two adjacent houses were broken into on the same night.
# Given a list of non-negative integers representing the amount
# of money of each house, determine the maximum amount of money
# you can rob
# Note: This is an extension of house_robber.rb
# Example 1:
# Input: [2,3,2]
# Output: 3
# Explanation: You cannot rob house 1 (money = 2) and then rob house 3 (money = 2), because they are adjacent houses.
# Example 2:
# Input: [1,2,3,1]
# Output: 4
# Explanation: Rob house 1 (money = 1) and then rob house 3 (money = 3).

# Solution:

# we want to use dynamic programming to solve this problem

# the idea is to create an array of the same size as the input array and set the first two values to the first two values of the input array
# we want to create two arrays, one that starts from the first value and ends at the second to last value and one that starts from the second value and ends at the last value
# we want to take the maximum of the two arrays and return the maximum value
# we want to do this because we want to ensure that we're getting the maximum amount of money we can rob

def rob(nums)
  # if there are no values in the array, we want to return 0 because there's nothing to rob
  return 0 if nums.empty?
  # if there's only one value in the array, we want to return that value because there's only one house to
  return nums[0] if nums.size == 1
  # if there are only two values in the array, we want to return the maximum of the two values because we can only rob one house
  return [nums[0], nums[1]].max if nums.size == 2
  # like the first house robber, we want to set the value of both our robbers to 0
  # we do this because we want to ensure we start at the beginning of each array
  rob1, rob2 = 0, 0
  # we want to create two arrays, one that starts from the first value and ends at the second to last value and one that starts from the second value and ends at the last value
  rob3, rob4 = 0, 0
  # we want to iterate through the array and compare the values from 0 to the second to last value
  (0...nums.size - 1).each do |i|
    # we want to set the temp variable to the maximum of the first value plus the current value and the second value
    temp = [rob1 + nums[i], rob2].max
    # we want to set rob1 to rob2 because we want to move to the next value
    rob1 = rob2
    # and we want to set rob2 to temp because we want to store the max value in rob2 before moving on to the next value
    rob2 = temp
  end
  # we want to iterate through the array and compare the values from 1 to the last value
  # this essentially creates a sliding window of the array using the first and second values
  # hence why we named the variables rob1, rob2, rob3, rob4
  (1...nums.size).each do |i|
    # we will then essentially repeat the process of the first iteration
    # we want to set the temp variable to the maximum of the first value plus the current value and the second value
    # we want to set rob3 to rob4 because we want to move to the next value
    # and we want to set rob4 to temp because we want to store the max value in rob4 before moving on to the next value
    temp = [rob3 + nums[i], rob4].max
    rob3 = rob4
    rob4 = temp
  end
  # we want to return the maximum of the two arrays between the final two values of the first and second arrays
  [rob2, rob4].max
end

# or using recursion and reducing the number of robbers needed

def rob(nums)
  # same base cases as the first iteration of this solution
  return 0 if nums.empty?
  return nums[0] if nums.size == 1
  return [nums[0], nums[1]].max if nums.size == 2
  # we want to return the maximum of the two arrays between the final two values of the first and second arrays
  [rob_helper(nums[0...-1]), rob_helper(nums[1..-1])].max
end

def rob_helper(nums)
  # essentially the same process as the first house robber, only we're using recursion
  # which speeds up the process 
  rob1, rob2 = 0, 0
  nums.each do |num|
    temp = [rob1 + num, rob2].max
    rob1 = rob2
    rob2 = temp
  end
  rob2
end