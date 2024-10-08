# Leetcode link: https://leetcode.com/problems/maximum-subarray/
# Problem: Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

# Solution:

def max_sub_array(nums)
  max_sum = nums[0]
  current_sum = 0
  for n in nums 
    if current_sum < 0
      current_sum = 0
    end
    current_sum += n
    max_sum = [max_sum, current_sum].max
  end
  return max_sum
end