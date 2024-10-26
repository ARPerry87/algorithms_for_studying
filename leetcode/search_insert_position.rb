# Leetcode link: https://leetcode.com/problems/search-insert-position/
# Problem: Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
# You must write an algorithm with O(log n) runtime complexity.

# Input: nums = [1,3,5,6], target = 5
# Output: 2
# Explanation: 5 is found at index 2.

# Input: nums = [1,3,5,6], target = 2
# Output: 1
# Explanation: 2 would be inserted at index 1.

# Input: nums = [1,3,5,6], target = 7
# Output: 4

# Plan:
# We should use binary search to find the target or the position to insert it.
# 1. Initialize two pointers, left and right.
# 2. While left is less than or equal to right, calculate the mid index.
# 3. If the middle element is equal to the target, return the mid index.
# 4. If the middle element is less than the target, move the left pointer to mid + 1.
# 5. If the middle element is greater than the target, move the right pointer to mid - 1.
# 6. If the target is not found, return the left pointer as the insertion position.
# 7. The time complexity is O(log n) due to the binary search.

# Let's implement the solution.

def search_insert(nums, target)
  left, right = 0, nums.length - 1

  while left <= right
    mid = left + (right - left) / 2

    if nums[mid] == target
      return mid
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end

  left
end