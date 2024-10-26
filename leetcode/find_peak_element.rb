#Leetcode link: https://leetcode.com/problems/find-peak-element/
# Description: A peak element in an array is an element that is strictly greater than its neighbors. Given an input array nums, you need to return the index of any peak element you find.
# You may imagine that nums[-1] = nums[n] = -∞.

# Example 1:
# Input: nums = [1,2,3,1]
# Output: 2
# Explanation: 3 is a peak element and your function should return the index 2.
 
# Example 2:
# Input: nums = [1,2,1,3,5,6,4]
# Output: 1 or 5
# Explanation: Your solution can return any peak index.

# Plan: 
# 1. We will use binary search to find a peak element in the array.
# 2. We will check the middle element and its neighbors to determine if it is a peak.
# 3. If the middle element is less than its right neighbor, it means there is a peak in the right half, so we will search in the right half.
# 4. If the middle element is less than its left neighbor, it means there is a peak in the left half, so we will search in the left half.
# 5. If the middle element is a peak, we will return its index.
# 6. The time complexity is O(log n) due to the binary search.
# 7. The space complexity is O(1) since we are not using any additional data structures.

def find_peak_element(nums)
  l, r = 0, nums.length - 1

  while l < r
    mid = l + (r-l) / 2

    if nums[mid] == nums[mid + 1]
      # If mid is equal to the next element, we can move right
      l = mid + 1
    elsif nums[mid] < nums[mid + 1]
      # If mid is less than the next element, peak must be in the right half
      l = mid + 1
    else
      # If mid is greater than the next element, peak must be in the left half
      r = mid
    end
  end

  l # l will be the index of a peak element
end