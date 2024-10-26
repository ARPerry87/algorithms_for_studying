# Leetcode link: https://leetcode.com/problems/search-in-rotated-sorted-array-ii/
# Description:
# There is an integer array nums sorted in ascending order and may contain duplicates.
# Before being passed to your function, nums is rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed).
# Given the array nums after the possible rotation and an integer target, return true if target is in nums, or false if it is not in nums.
# You must write an algorithm with O(log n) runtime complexity.
# Example 1:
# Input: nums = [2,5,6,0,0,1,2], target = 0
# Output: true

# Example 2:
# Input: nums = [2,5,6,0,0,1,2], target = 3
# Output: false

# Plan:
# 1. We will use binary search to find the target in the rotated sorted array.
# 2. We will handle duplicates by skipping over them when we encounter them.
# 3. If the mid element is equal to the leftmost element, we will increment the left pointer to skip the duplicate.
# 4. If the mid element is greater than or equal to the leftmost element, it means the left half is sorted.
# 5. If the target is in the left half, we will search in the left half; otherwise, we will search in the right half.
# 6. If the mid element is less than the leftmost element, it means the right half is sorted.
# 7. If the target is in the right half, we will search in the right half; otherwise, we will search in the left half.
# 8. If the target is not found, we will return false.
# 9. The time complexity is O(log n) due to the binary search.
# 10. The space complexity is O(1) since we are not using any additional data structures.

# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}
def search(nums, target)
  low, high = 0, nums.size - 1
  
  while low <= high
    mid = low + (high-low)/2
    
    if nums[mid] == target
      return true
    elsif nums[mid] < nums[high]
      if (nums[mid]..nums[high]).cover?(target)
        low = mid + 1
      else
        high = mid - 1
      end
    elsif nums[mid] > nums[high]
      if (nums[low]..nums[mid]).cover?(target)
        high = mid - 1
      else
        low = mid + 1
      end
    else
      high = high - 1
    end
  end

  false
end

# or this version 

# @param {Integer[]} nums
# @param {Integer} target
# @return {Boolean}

def search(nums, target)
  low, high = 0, nums.size - 1
  
  while low <= high
    mid = low + (high-low)/2
    
    if nums[mid] == target
      return true
    elsif nums[mid] < nums[high]
      if target > nums[mid] && target <= nums[high]
        low = mid + 1
      else
        high = mid - 1
      end
    elsif nums[mid] > nums[high]
      if target >= nums[low] && target < nums[mid]
        high = mid - 1
      else
        low = mid + 1
      end
    else
      high -= 1
    end
  end

  false
end