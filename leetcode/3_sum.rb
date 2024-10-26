# Leetcode link: https://leetcode.com/problems/3sum/
 
# Problem: Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
 
# Notice that the solution set must not contain duplicate triplets.

# # Solution


def three_sum(nums)
  res = []
  nums.sort!
  (0...nums.length).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]
    l, r = i + 1, nums.length - 1
    while l < r
      sum = nums[i] + nums[l] + nums[r]
      if sum == 0
        res << [nums[i], nums[l], nums[r]]
        l += 1
        r -= 1
        l += 1 while l < r && nums[l] == nums[l - 1]
        r -= 1 while l < r && nums[r] == nums[r + 1]
      elsif sum < 0
        l += 1
      else
        r -= 1
      end
    end
  end
  res
end
