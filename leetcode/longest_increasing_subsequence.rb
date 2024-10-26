# Leetcode link: https://leetcode.com/problems/longest-increasing-subsequence/
# Description: Given an unsorted array of integers, find the length of longest increasing subsequence.
# Example 1:
# Input: [10,9,2,5,3,7,101,18]
# Output: 4
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
# Example 2:
# Input: [10,9,2,5,3,4]
# Output: 3
# Explanation: The longest increasing subsequence is [2,3,4], therefore the length is 3.
# Note:
# There may be more than one LIS combination, it is only necessary for you to return the length.

# solution

def length_of_lis(nums)
  return 0 if nums.empty?
  dp = Array.new(nums.size, 1)
  max = 1
  nums.each_with_index do |n, i|
    (0..i).each do |j|
      dp[i] = [dp[i], dp[j] + 1].max if nums[j] < n
    end
    max = [max, dp[i]].max
  end
  max
end

# or 

def length_of_lis(nums)
  # I prefer this solution in terms of readability
  # we want to return 0 if the array is empty for edge cases
  # then we want to create an array of the same size as the input array and set all the values to 1
  # we want to set all the values to 1 because the minimum length of the longest increasing subsequence is 1 by default
  return 0 if nums.empty?
  lis = [1] * nums.size

  # we want to iterate through the array and compare the values
  
  (1...nums.size).each do |i|
    # we want to iterate through the array again and compare the values to see if the current value is greater than the previous value
    # if it is, we can add 1 to the previous value
    # if it's not, we can take the maximum of the previous value
    # we want to do this because we want to ensure that we're getting the longest increasing subsequence
    # essentially we have a pointer at both i and j, where j is less than i and we're comparing the values at those indexes
    (0...i).each do |j|
      # if the value at j is less than the value at i, we can add 1 to the value at i and move to the next value
      # if the value at j is not less than the value at i, we can take the maximum of the value at i and the value at j
      lis[i] = [lis[i], lis[j] + 1].max if nums[j] < nums[i]
    end
  end 
  lis.max
end

# faster

def length_of_lis(nums)
  memo = nums.inject([]) do |memo, num|
    if memo.empty? || num > memo.last
      memo << num
    else
      left, right = 0, memo.size - 1
      while left < right
        mid = left + (right - left) / 2
        if memo[mid] < num
          left = mid + 1
        else
          right = mid
        end
      end
      memo[right] = num
    end
    memo
  end
  memo.size
end