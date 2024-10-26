# Leetcode link: https://leetcode.com/problems/search-in-rotated-sorted-array/
# Description: 
# There is an integer array nums sorted in ascending order (with distinct values).

# Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

# Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

# You must write an algorithm with O(log n) runtime complexity.

# Example 1: 
# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4
# 
# Example 2:
# Input: nums = [4,5,6,7,0,1,2], target = 3
# Output: -1

# Plan: 
# 1. We will use binary search to find the target in the rotated sorted array.
# 2. First, we will find the mid index and check if the mid element is equal to the target.
# 3. If the mid element is greater than or equal to the leftmost element, it means the left half is sorted.
# 4. If the target is in the left half, we will search in the left half; otherwise, we will search in the right half.
# 5. If the mid element is less than the leftmost element, it means the right half is sorted.
# 6. If the target is in the right half, we will search in the right half; otherwise, we will search in the left half.
# 7. If the target is not found, we will return -1.
# 8. The time complexity is O(log n) due to the binary search.

def search(nums, target)
  l, r = 0, nums.length - 1

  while l <= r 
    mid = (l + (r - l) / 2).floor

    if nums[mid] == target
      return mid
    elsif nums[mid] >= nums[l] # This means that the left half is sorted because the leftmost element is less than or equal to the mid element
      if nums[l] <= target && target < nums[mid] # This means that the target is in the left half because it is greater than or equal to the leftmost element and less than the mid element
        r = mid - 1
      else # Target is in the right half
        l = mid + 1
      end
    else # Right half is sorted because the mid element is less than the leftmost element
      if nums[mid] < target && target <= nums[r] # Target is in the right half because it is greater than the mid element and less than or equal to the rightmost element
        l = mid + 1
      else # Target is in the left half because it is less than or equal to the mid element
        r = mid - 1
      end
    end
  end
  -1 # Target not found
end