# Leetcode link: https://leetcode.com/problems/kth-factor-of-n/
# Description: Given two positive integers n and k. A factor of an integer n is defined as an integer i where n % i == 0. Consider a list of all factors of n sorted in ascending order, return the kth factor in this list or return -1 if n has less than k factors.
# Example 1:
# Input: n = 12, k = 3
# Output: 3
# Explanation: Factors list is [1, 2, 3, 4, 6, 12], the 3rd factor is 3.
# Example 2:
# Input: n = 7, k = 2
# Output: 7
# Explanation: Factors list is [1, 7], the 2nd factor is 7.
# Example 3:
# Input: n = 4, k = 4
# Output: -1
# Explanation: Factors list is [1, 2, 4], there is only 3 factors. We should return -1.

# Solution:

def kth_factor(n, k)
  # we should store the factors in an array
  # we should iterate through the range of 1 to n
  # we should check if n is divisible by i
  # if it is, we should add i to the factors array
  # if the factors array is less than k, we should return -1
  # if the factors array is greater than or equal to k, we should return the kth element
  
  factors = [] # initialize the factors array

  (1..n).each do |i| # iterate through the range of 1 to n, we start at index 1 because we don't want to divide by 0
    factors << i if n % i == 0 # if n is divisible by i, we can add i to the factors array
  end

  return -1 if factors.size < k # if the factors array is less than k, we can return -1
  factors[k - 1] # if the factors array is greater than or equal to k, we can return the kth element
end