# Leetcode link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/
# Problem: Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:
# [4,5,6,7,0,1,2] if it was rotated 4 times.
# [0,1,2,4,5,6,7] if it was rotated 7 times.

# Solution

def find_min(nums)
  l, r = 0, nums.length - 1
  res = nums[0]

  while l <= r 
    if nums[l] < nums[r]
      res = [res, nums[l]].min
      break
    end
    mid = (l + r) / 2
    res = [res, nums[mid]].min
    if nums[mid] >= nums[l]
      l = mid + 1
    else
      r = mid - 1
    end
  end
  return res
end

# optimized

def find_min(nums)
  l, r = 0, nums.length - 1

  while l < r
    mid = (l + r) / 2
    if nums[mid] > nums[r]
      l = mid + 1
    else
      r = mid
    end
  end

  nums[l]
end