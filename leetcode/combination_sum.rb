# Leetcode link: https://leetcode.com/problems/combination-sum/
# Description: Given a set of candidate numbers (candidates) (without duplicates) and a target number (target), find all unique combinations in candidates where the candidate numbers sums to target.
# The same repeated number may be chosen from candidates unlimited number of times.
# Note:
# All numbers (including target) will be positive integers.
# The solution set must not contain duplicate combinations.
# Example 1:
# Input: candidates = [2,3,6,7], target = 7,
# A solution set is:
# [
#  [7],
#  [2,2,3]
#  ]
#  Example 2:
#  Input: candidates = [2,3,5], target = 8,
#  A solution set is:
#  [
#  [2,2,2,2],
#  [2,3,3],
#  [3,5]
#  ]
#  Constraints:
#  1 <= candidates.length <= 30
#  1 <= candidates[i] <= 200
#  Each element of candidate is unique.
#  1 <= target <= 500

# Solution:

# dfs is the most common way to solve this problem and it's a backtracking algorithm
# the idea is to iterate through the array and compare the values
# if the target is less than 0, we can return
# if the target is equal to 0, we can return the result
# if the target is greater than 0, we can iterate through the array and compare the values
# if the target - the value at the current index is greater than 0, we can add the value to the path and move to the next value
# if the target - the value at the current index is equal to 0, we can return the result
# if the target - the value at the current index is less than 0, we can return
# we want to use a helper method to solve this problem
# the helper method will take in the array, the target, the index, the path, and the result
# we want to return the result at the end
# the time complexity is O(n^m) where n is the number of candidates and m is the target
# the space complexity is O(m) where m is the target

def combination_sum(candidates, target)
  result = []
  dfs(candidates, target, 0, [], result)
  result
end

def dfs(candidates, target, index, path, result)
  return if target < 0
  return result.push(path) if target == 0
  
  (index...candidates.size).each do |i|
    dfs(candidates, target - candidates[i], i, path + [candidates[i]], result)
  end
end

# or using dynamic programming

def combination_sum(candidates, target)
  # we want to make an array of the same size as target + 1 and set all the values to an empty array
  dp = Array.new(target + 1) { [] }
  dp[0] = [[]]

  # we want to iterate through the array and compare the values
  candidates.each do |num|
    (num..target).each do |i|
      # we want to check if the current value is greater than or equal to the number
      # if it is, we can add the number to the value at i - num
      # if it's not, we can move to the next value
      dp[i] += dp[i - num].map { |arr| arr + [num] }
    end
  end
  dp[target]
end

def combination_sum(candidates, target)
  result = []
  dfs(candidates, target, 0, [], result)
  result
end

def dfs(candidates, target, index, path, result)
  return if target < 0
  return result.push(path) if target == 0
  
  (index...candidates.size).each do |i|
    dfs(candidates, target - candidates[i], i, path + [candidates[i]], result)
  end
end

# or using dynamic programming

def combination_sum(candidates, target)
  # we want to make an array of the same size as target + 1 and set all the values to an empty array
  dp = Array.new(target + 1) { [] }
  dp[0] = [[]]

  # we want to iterate through the array and compare the values
  candidates.each do |num|
    (num..target).each do |i|
      # we want to check if the current value is greater than or equal to the number
      # if it is, we can add the number to the value at i - num
      # if it's not, we can move to the next value
      dp[i] += dp[i - num].map { |arr| arr + [num] }
    end
  end
  dp[target]
end
