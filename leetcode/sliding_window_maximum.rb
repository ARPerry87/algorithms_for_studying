# Leetcode link: https://leetcode.com/problems/sliding-window-maximum/
# Problem: You are given an array of integers nums, there is a sliding window of size k 
# which is moving from the very left of the array to the very right. 
# You can only see the k numbers in the window. 
# Each time the sliding window moves right by one position.
 
# Return the max sliding window.
 
# Example 1:
# Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
# Output: [3,3,5,5,6,7]

# Plan: 
# Use a deque to store the indices of the elements in the window.
# We will iterate through the array and add the index to the deque.
# If the index is outside the window, we will remove it from the deque.
# If the index is less than the current element, we will remove it from the deque.
# We will add the index to the deque if it is greater than the current element.
# We will add the maximum element to the result array if the window size is equal to k.
# The time complexity is O(n) and the space complexity is O(k).

def max_sliding_window(nums, k)
  return [] if nums.empty?
  return nums if k == 1 # If the window size is 1, return the array as is

  deque = []
  result = []

  nums.each_with_index do |num, i|
    # Remove indices that are out of the current window
    deque.shift if !deque.empty? && deque[0] <= i - k
    # Remove indices whose corresponding values are less than the current element
    deque.pop while !deque.empty? && nums[deque[-1]] < num
    # Add the current element's index to the deque
    deque << i
    # Add the maximum element of the current window to the result
    result << nums[deque[0]] if i >= k - 1
  end

  result
end