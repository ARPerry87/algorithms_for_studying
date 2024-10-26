# Leetcode link: https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/

# Problem: Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
# If target is not found in the array, return [-1, -1].
# You must write an algorithm with O(log n) runtime complexity.
 
# Example 1:
# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]

# Plan: 
# 1. We will use binary search to find the first and last position of the target.
# 2. First, we will find the leftmost index of the target using binary search.
# 3. Then, we will find the rightmost index of the target using binary search.
# 4. If the target is not found, we will return [-1, -1].
# 5. The time complexity is O(log n) due to the binary search.
# 6. Let's implement the solution.

def search_range(nums, target)
  l, r = 0, nums.length - 1

  while l <= r
    mid = l + (r - l) / 2

    if nums[mid] < target
      l = mid + 1
    elsif nums[mid] > target
      r = mid - 1
    else
      # Found the target, now find the leftmost index
      left_index = mid
      while left_index > 0 && nums[left_index - 1] == target
        left_index -= 1
      end

      # Now find the rightmost index
      right_index = mid
      while right_index < nums.length - 1 && nums[right_index + 1] == target
        right_index += 1
      end

      return [left_index, right_index]
    end
  end
  [-1, -1] # Target not found
end