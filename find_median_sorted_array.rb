# Leetcode link: https://leetcode.com/problems/median-of-two-sorted-arrays/
# Problem: Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
# The overall run time complexity should be O(log (m+n)).
# Example:
# Input: nums1 = [1,3], nums2 = [2]
# Output: 2.00000
# Explanation: merged array = [1,2,3] and median is 2.

# Solution:
# This is fast on Runtime but slow on memory usage
def find_median_sorted_arrays(nums1, nums2)
  # we merge the two arrays together using the splat operator
  # we then sort the array
  # we then find the middle of the array
  # we then check if the array is even or odd
  # if it's even we return the average of the two middle numbers
  # if it's odd we return the middle number
  merged = [*nums1, *nums2].sort
  mid = merged.length / 2
  merged.length.odd? ? merged[mid] : (merged[mid - 1] + merged[mid]) / 2.0
end

# This is faster on memory usage but slower on runtime
def find_median_sorted_arrays(nums1, nums2)
  merged = []
  i, j = 0, 0

  while i < nums1.length && j < nums2.length
    if nums1[i] < nums2[j]
      merged << nums1[i]
      i += 1
    else
      merged << nums2[j]
      j += 1
    end
  end

  while i < nums1.length
    merged << nums1[i]
    i += 1
  end

  while j < nums2.length
    merged << nums2[j]
    j += 1
  end

  mid = merged.length / 2
  if merged.length.even?
    return (merged[mid - 1] + merged[mid]) / 2.0
  else
    return merged[mid]
  end
end

