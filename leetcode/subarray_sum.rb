# Leetcode link: https://leetcode.com/problems/subarray-sum-equals-k/
# Description: Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.
# Example 1:
# Input: nums = [1,1,1], k = 2
# Output: 2
# Example 2:
# Input: nums = [1,2,3], k = 3
# Output: 2
# Note:
# The length of the array is in range [1, 20,000].
# The range of numbers in the array is [-1000, 1000] and the range of the integer k is [-1e7, 1e7].

# Solution:

def subarray_sum(nums, k)
  sum = 0
  count = 0
  hash = {0 => 1} # initialize the hash with one key-value pair of 0 => 1
  
  nums.each do |n| # iterate through the array
    sum += n # increment the sum by the current value
    count += hash[sum - k].to_i # increment the count by the value of the hash at the difference of the sum and k
    hash[sum] = hash[sum].to_i + 1
  end
  
  count
end