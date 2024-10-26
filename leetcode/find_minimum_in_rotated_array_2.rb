# Leetcode link: https://leetcode.com/problems/find-minimum-in-rotated-sorted-array-ii/
# Description: 
# Suppose an array of length n sorted in ascending order is rotated between 1 an n times. 
# For example: the array nums = [0,1,4,4,5,6,7] might become:

# [4,5,6,7,0,1,4] if it was rotated 4 times.
# [0,1,4,4,5,6,7] if it was rotated 7 times.
# Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

# Given the sorted rotated array nums that may contain duplicates, return the minimum element of this array.

# You must decrease the overall operation steps as much as possible.

# Example 1:
# Input: nums = [1,3,5]
# Output: 1
# Explanation: The minimum element is 1.

# Example 2:
# Input: nums = [2,2,2,0,1]
# Output: 0
# Explanation: The minimum element is 0.

# Plan:
# 1. We will use binary search to find the minimum element in the rotated sorted array.
# 2. We will handle duplicates by skipping over them when we encounter them.
# 3. If the mid element is equal to the leftmost element, we will increment the left pointer to skip the duplicate.
# 4. If the mid element is greater than or equal to the leftmost element, it means the left half is sorted.
# 5. The minimum element must be in the right half, so we will search in the right half.
# 6. If the mid element is less than the rightmost element, it means the right half is sorted.
# 7. The minimum element must be in the left half, so we will search in the left half.
# 8. If the target is not found, we will return false.
# 9. The time complexity is O(log n) due to the binary search.
# 10. The space complexity is O(1) since we are not using any additional data structures.

def find_min(nums)
  low, high = 0, nums.size - 1 # set the low and high pointers

  while low < high # while our low index is less than the high one 
    mid = low + (high - low) / 2 # find the mid index
    if nums[mid] > nums[high] # if the mid element is greater than the high element, the minimum must be in the right half
      low = mid + 1 # move the low pointer to mid + 1
    elsif nums[mid] < nums[high] # if the mid element is less than the high element, the minimum must be in the left half
      high = mid # move the high pointer to mid
    else
      high -= 1 # else we decrement the high pointer to skip duplicates
    end
  end

  nums[low]
end