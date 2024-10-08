# Leetcode link: https://leetcode.com/problems/search-in-rotated-sorted-array/
# Problem: There is an integer array nums sorted in non-decreasing order (not necessarily with distinct values).
# Before being passed to your function, nums is rotated at an unknown pivot index k (0 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,4,4,5,6,6,7] might be rotated at pivot index 5 and become [4,5,6,6,7,0,1,2,4,4].
# Given the array nums after the rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.
# You must write an algorithm with O(log n) runtime complexity.

# Solution:
# Given that this has a O(log n) runtime complexity, we can use binary search to solve this problem.

def search(nums, target)
  # initialize the left and right pointers
  l, r = 0, nums.length - 1
    # we iterate through the array
    # if the mid value is equal to the target, we return the mid value
    # if the mid value is greater than or equal to the left value, we check if the target is greater than or equal to the left value and less than the mid value
    # if it is, we update the right pointer to mid - 1
    # if it isn't, we update the left pointer to mid + 1
    while l <= r
      mid = (l + r) / 2
      if nums[mid] == target
        return mid
      end
      if nums[mid] >= nums[l]
        if target >= nums[l] && target < nums[mid]
          r = mid - 1
        else
          l = mid + 1
        end
      else
        if target <= nums[r] && target > nums[mid]
          l = mid + 1
        else
          r = mid - 1
        end
      end
    end
  return -1
end

# optimized

def search(nums, target)
  l, r = 0, nums.length - 1

  while l <= r
    mid = (l + r) / 2
    return mid if nums[mid] == target

    if nums[l] <= nums[mid]
      if nums[l] <= target && target < nums[mid]
        r = mid - 1
      else
        l = mid + 1
      end
    else
      if nums[mid] < target && target <= nums[r]
        l = mid + 1
      else
        r = mid - 1
      end
    end
  end

  -1
end