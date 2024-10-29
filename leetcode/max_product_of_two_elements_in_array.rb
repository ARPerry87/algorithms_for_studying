# Leetcode link: https://leetcode.com/problems/max-product-of-two-elements-in-an-array/
# Given the array of integers nums, you will choose two different indices
# i and j of that array. Return the maximium value of (nums[i]-1)*(nums[j]-1).
 
# Example 1:
# Input: nums = [3,4,5,2]
# Output: 12
# Explanation: If you choose the indices i = 1 and j = 0, we have (nums[1]-1)*(nums[0]-1) = (4-1)*(3-1) = 3*2 = 6.
# If you choose the indices i = 2 and j = 0, we have (nums[2]-1)*(nums[0]-1) = (5-1)*(3-1) = 8.
# If you choose the indices i = 2 and j = 1, we have (nums[2]-1)*(nums[1]-1) = (5-1)*(4-1) = 12.
 
# Example 2:
# Input: nums = [1,5,4,5]
# Output: 16
# Explanation: Choosing the indices i = 1 and j = 3, we have (nums[1]-1)*(nums[3]-1) = (5-1)*(5-1) = 16.
 
# Constraints:
# 2 <= nums.length <= 500
# 1 <= nums[i] <= 1000

# Plan:
# 1. We will find the two largest numbers in the array using sliding window technique or binary search.
# 2. We will calculate the product of (max1 - 1) * (max2 - 1).
# 3. The time complexity is O(n) and the space complexity is O(1).

def max_product(nums)
  l, r = 0, 0 # Initialize the two largest numbers

  nums.each do |n| # Iterate through the array
    if n > l  # If the current number is greater than the largest number
      r = l  # Update the second largest number
      l = n # Update the largest number
    elsif n > r # If the current number is greater than the second largest number
      r = n # Update the second largest number
    else
      next # Continue to the next number
    end
  end

  (l - 1) * (r - 1) # Return the product of the two largest numbers minus 1
end

# or 

def max_product(nums)
  # Sort the array using binary search
  nums.sort!

  # Get the two largest numbers
  max1 = nums[-1]
  max2 = nums[-2]

  # Return the product of the two largest numbers minus 1
  (max1 - 1) * (max2 - 1)
end