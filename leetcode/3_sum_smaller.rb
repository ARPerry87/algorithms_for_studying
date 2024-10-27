# Leetcode link: https://leetcode.com/problems/3sum-smaller/
# Given an array of n integers nums and an integer target, find the number of index triplets i, j, k with 0 <= i < j < k < n that satisfy the condition nums[i] + nums[j] + nums[k] < target.

# Example 1: 
# Input: nums = [-2,0,1,3], target = 2
# Output: 2
# Explanation: Because there are two triplets which sums are less than 2:
# [-2,0,1] and [-2,0,3].

# Example 2:
# Input: nums = [], target = 0
# Output: 0

# Plan:
# 1. We will sort the array to make it easier to find triplets.
# 2. We will use a binary search approach to find the number of valid triplets for each element in the array.
# 3. For each element nums[i], we will use two pointers to find the other two elements nums[j] and nums[k].
# 4. If the sum of the triplet is less than the target, we will count all the valid pairs (j, k) and move the left pointer to the right.
# 5. If the sum is greater than or equal to the target, we will move the right pointer to the left.
# 6. We will return the total count of valid triplets.
# 7. The time complexity is O(n^2) due to the nested loops.
# 8. The space complexity is O(1) since we are not using any additional data structures.

def three_sum_smaller(nums, target)
  nums.sort! # Step 1: sort the array so we can use two pointers
  count = 0 # Initialize count of valid triplets

  (0...nums.length - 2).each do |i| # iterate through the array stopping two elements before the end
    left, right = i + 1, nums.length - 1 # set left pointer to the next element and the right pointer to the last element

    while left < right # while the left pointer is less than the right pointer`
      sum = nums[i] + nums[left] + nums[right] # calculate the sum of the triplet

      if sum < target # if the sum is less than the target
        count += right - left # count all valid pairs (j, k) and move the left pointer to the right
        left += 1
      else # if the sum is greater than or equal to the target
        right -= 1 # move the right pointer to the left
      end
    end
  end

  count # return the total count of valid triplets
end
