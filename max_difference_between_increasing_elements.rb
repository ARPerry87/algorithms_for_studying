# Leetcode https://leetcode.com/problems/maximum-difference-between-increasing-elements/
# Given a 0-indexed integer array nums of size n, find the maximum difference between nums[i] and nums[j] (i < j) such that nums[i] < nums[j]. Return the maximum difference. If no such i and j exists, return -1.
# 
# Example 1:
# Input: nums = [7,1,5,4]
# Output: 4
# Explanation:
# The maximum difference is between nums[1] and nums[2].
# nums[1] = 1 and nums[2] = 5.
 
def maximum_difference(nums)
  max_dif = -1 # initialize the maximum difference to -1
  min_val = nums[0] # initialize the minimum value to the first element in the array

  for i in 0..nums.length-1 # iterate through the array from 0 to the length of the array - 1 (aka the last element)
      if nums[i] <= min_val # if nums of i is less than or equal to min value
          min_val = nums[i] # set the min value to nums of i
      else 
          max_dif = [max_dif, nums[i] - min_val].max # otherwise, set the maximum difference to the maximum of the current maximum difference and the difference between nums of i and the min value
      end
  end
  max_dif

end