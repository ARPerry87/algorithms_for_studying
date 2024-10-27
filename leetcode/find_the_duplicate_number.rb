# Leetcode link: https://leetcode.com/problems/find-the-duplicate-number/
# Problem: Given an integer array nums containing n + 1 integers where each integer is in the range [1, n] inclusive.
# There is only one duplicate number in nums, return this duplicate number.
# You must solve the problem without modifying the array nums and using only constant extra space.

# Example 1:
# Input: nums = [1,3,4,2,2]
# Output: 2

# Example 2:
# Input: nums = [3,1,3,4,2]
# Output: 3

# Plan: 
# 1. We will use binary search to find the duplicate number.
# 2. We will maintain a count of numbers that are less than or equal to the mid value.
# 3. If the count is greater than mid, it means the duplicate is in the left half; otherwise, it is in the right half.
# 4. We will continue this process until we find the duplicate number.
# 5. The time complexity is O(n log n) and the space complexity is O(1).

# This is a linked list cycle problem, so Floyd's is the preferred but let's do binary search first

def find_duplicate(nums)
  l, r = 1, nums.length - 1

  while l < r
    mid = (l + (r - l) / 2).floor
    count = nums.count{ |num| num <= mid }

    if count > mid
      r = mid
    else
      l = mid + 1
    end
  end

  l
end

# or using a different approach with Floyd's Tortoise and Hare (Cycle Detection)

def find_duplicate(nums)
  tortoise = nums[0]
  hare = nums[0]

  # Step 1: Finding the intersection point in the cycle
  begin
    tortoise = nums[tortoise]
    hare = nums[nums[hare]]
  end while tortoise != hare

  # Step 2: Find the entrance to the cycle
  tortoise = nums[0]
  while tortoise != hare
    tortoise = nums[tortoise]
    hare = nums[hare]
  end

  tortoise
end