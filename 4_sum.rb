# Leetcode link: https://leetcode.com/problems/4sum/
# Problem: Given an array nums of n integers, return an array of all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:

# 0 <= a, b, c, d < n
# a, b, c, and d are distinct.
# nums[a] + nums[b] + nums[c] + nums[d] == target
# You may return the answer in any order.

# # Solution

def four_sum(nums, target)
  res = []
  nums.sort!
  (0...nums.length).each do |i|
    next if i > 0 && nums[i] == nums[i - 1]
    (i + 1...nums.length).each do |j|
      next if j > i + 1 && nums[j] == nums[j - 1]
      l, r = j + 1, nums.length - 1
      while l < r
        sum = nums[i] + nums[j] + nums[l] + nums[r]
        if sum == target
          res << [nums[i], nums[j], nums[l], nums[r]]
          l += 1
          r -= 1
          l += 1 while l < r && nums[l] == nums[l - 1]
          r -= 1 while l < r && nums[r] == nums[r + 1]
        elsif sum < target
          l += 1
        else
          r -= 1
        end
      end
    end
  end
  res
end

#using recursion
#
def four_sum(nums, target)
  nums.sort!
  find_n_sum(nums, target, 4, [])
end

def find_n_sum(nums, target, n, result)
  res = []
  return res if nums.length < n || n < 2

  if n == 2
    l, r = 0, nums.length - 1
    while l < r
      sum = nums[l] + nums[r]
      if sum == target
        res << result + [nums[l], nums[r]]
        l += 1
        r -= 1
        l += 1 while l < r && nums[l] == nums[l - 1]
        r -= 1 while l < r && nums[r] == nums[r + 1]
      elsif sum < target
        l += 1
      else
        r -= 1
      end
    end
  else
    (0..(nums.length - n)).each do |i|
      if i == 0 || (i > 0 && nums[i] != nums[i - 1])
        res += find_n_sum(nums[i + 1..-1], target - nums[i], n - 1, result + [nums[i]])
      end
    end
  end

  res
end
