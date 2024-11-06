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

# faster 

def max_sub_array(nums)
  max_sum = nums[0] # set the max sum to the first value in the array
  current_sum = 0 # set the current sum to 0
  nums.each do |n| # iterate through the array
    current_sum = [current_sum + n, n].max # set the current sum to the maximum of the current sum plus the current value and the current value
    max_sum = [max_sum, current_sum].max # set the max sum to the maximum of the max sum and the current sum
  end
  max_sum # return the max sum
end

# fastest

def max_sub_array(nums)
  result, max_end = nums[0], nums[0]
    i = 1
    while i < nums.length do
        max_end = [max_end + nums[i], nums[i]].max
        result = [result, max_end].max
        i += 1
    end
    result
end