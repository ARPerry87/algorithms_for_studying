# Leetcode link: https://leetcode.com/problems/kth-largest-element-in-an-array/
# Description: Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
# Example 1:
# Input: [3,2,1,5,6,4] and k = 2
# Output: 5
# Example 2:
# Input: [3,2,3,1,2,4,5,5,6] and k = 4
# Output: 4
# Note:
# You may assume k is always valid, 1 ≤ k ≤ array's length.

# Solution:

def find_kth_largest(nums, k)
  nums.sort!
  nums[-k]
end

# but for seriously doing it algorithmically 

def find_kth_largest(nums, k)
  freqs = nums.tally # we want to count the frequency of each element in the array
  
  count = 0 # we want to set the count to 0
  (nums.max).downto(nums.min) do |n| # we want to iterate from the maximum value down to the minimum
    if freqs[n]
      count += freqs[n] # we want to add the frequency of the current value to the count

      return n if count >= k # if the count is greater than or equal to k, we can return the value
    end
  end
end
