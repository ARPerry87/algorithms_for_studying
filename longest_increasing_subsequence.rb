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
  lis = [1] * nums.size
  (1...nums.size).each do |i|
    (0...i).each do |j|
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