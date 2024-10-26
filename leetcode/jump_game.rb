# Leetcode link: https://leetcode.com/problems/jump-game/
# Description: You are given an integer array nums. 
# You are initially positioned at the array's first index, and each element in the array represnts your max jump length at that position. 
# Return true if you can reach the last index, or false otherwise.
# 
# Example 1:
# Input: nums = [2,3,1,1,4]
# Output: true
# Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
# 
# Example 2:
# Input: nums = [3,2,1,0,4]
# Output: false
# Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

def can_jump(nums)
  return true if nums.length == 1 # return true if the length of the array is 1
  return false if nums[0] == 0 # return false if the first element in the array is 0
  
  max_jump = nums[0] # initialize the maximum jump to the first element in the array
  for i in 1..nums.length-1 # iterate through the array from 1 to the length of the array - 1
      return false if max_jump < i # return false if the maximum jump is less than i
      max_jump = [max_jump, i + nums[i]].max # set the maximum jump to the maximum of the current maximum jump and i + nums of i
  end
  true
end

def can_jump(nums)
  goal = nums.length - 1

  (nums.length - 1).downto(0) do |i|
    if i + nums[i] >= goal
      goal = i
    end
  end
  return goal == 0
end