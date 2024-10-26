# Leetcode link: https://leetcode.com/problems/minimum-size-subarray-sum/
# Description: Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.
# Example 1:
# Input: target = 7, nums = [2,3,1,2,4,3]
# Output: 2
# Explanation: The subarray [4,3] has the minimal length under the problem constraint.
# Example 2:
# Input: target = 4, nums = [1,4,4]
# Output: 1
# Explanation: The subarray [4] has the minimal length under the problem constraint.

# Plan:
# 1. We will use a sliding window approach to find the minimal length of a contiguous subarray.
# 2. We will maintain a variable to keep track of the current sum and another variable to keep track of the minimum length.
# 3. We will expand the window by moving the right pointer and adding the current element to the sum.
# 4. If the sum is greater than or equal to the target, we will try to shrink the window from the left by moving the left pointer and updating the minimum length.
# 5. If the sum is less than the target, we will continue expanding the window.
# 6. If we find a valid subarray, we will return the minimum length; otherwise, we will return 0.
# 7. The time complexity is O(n) since we are iterating through the array once.
# 8. The space complexity is O(1) since we are not using any additional data structures.

# I prefer sliding window for this as it's faster and easier to read 

def min_sub_array_len(target, nums)
  left = 0
  sum = 0 
  min_length = Float::INFINITY

  nums.each_with_index do |num, i|
    sum += num
    while sum >= target
      min_length = [min_length, i - left + 1].min
      sum -= nums[left]
      left += 1
    end
  end

  min_length == Float::INFINITY ? 0 : min_length
end

# now with binary search versus sliding window

# Binary Search Approach
# Plan: 
# 1. We will use binary search to find the minimal length of a contiguous subarray.
# 2. We will create a prefix sum array to store the cumulative sums of the input array.
# 3. For each element in the prefix sum array, we will perform a binary search to find the smallest index where the sum is greater than or equal to target.
# 4. We will calculate the length of the subarray and update the minimum length if necessary.
# 5. If we find a valid subarray, we will return the minimum length; otherwise, we will return 0.
# 6. The time complexity is O(n log n) due to the binary search for each element.
# 7. The space complexity is O(n) for the prefix sum array.

# @param {Integer} target
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(target, nums)
  prefix_sum = [0] * (nums.length + 1)
  min_length = Float::INFINITY

  nums.each_with_index do |num, i|
    prefix_sum[i + 1] = prefix_sum[i] + num
  end

  (1..nums.length).each do |i|
    required_sum = target + prefix_sum[i - 1]
    bound = prefix_sum.bsearch_index { |x| x >= required_sum }
    if bound
      min_length = [min_length, bound - (i - 1)].min
    end
  end

  min_length == Float::INFINITY ? 0 : min_length
end