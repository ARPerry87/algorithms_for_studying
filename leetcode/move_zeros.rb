# Leetcode link: https://leetcode.com/problems/move-zeroes/
# Given an integer array nums, move all 0's to the end of it while maintiaining order of the non-zero elements. 
# Note that you must do this in place without making a copy of the array. 
 
# Example 1:
# Input: nums = [0,1,0,3,12]
# Output: [1,3,12,0,0]
 
# Example 2:
# Input: nums = [0]
# Output: [0]

# Plan:
# 1. Use two pointer technique, one pointer to track the position of non-zero elements and the other to iterate through the array.
# 2. If the current element is non-zero, we will swap it with the element at the position of the first pointer and increment the first pointer.
# 3. Continue this process until we have iterated through the entire array.
# 4. The time complexity is O(n) and the space complexity is O(1).

def move_zeroes(nums)
  l, r = 0, 0 # Initialize two pointers

  while r < nums.length # Iterate through the array
    if nums[r] != 0 
      nums[l], nums[r] = nums[r], nums[l] # swap the non-zero element with the element at the left pointer
      l += 1 # Increment the left pointer
    end
    r += 1 # Increment the right pointer
  end

  nums # Return the modified array
end

# or using a different approach with a single pointer

def move_zeroes(nums)
  count = 0 

  nums.each do |n|
    if n != 0
      nums[count] = n # Move non-zero elements to the front
      count += 1 # Increment the count of non-zero elements
    end
  end

  while count < nums.length
    nums[count] = 0 # Fill the remaining positions with zeros
    count += 1
  end

  nums # Return the modified array
end