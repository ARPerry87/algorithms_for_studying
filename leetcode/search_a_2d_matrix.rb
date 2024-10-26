# Leetcode link: https://leetcode.com/problems/search-a-2d-matrix/
# Description: You are given an m x n integer matrix matrix with the following two properties:
# Each row is sorted in nondecreasing order.
# The first integer of each row is greater than the last integer of the previous row.
# Given an integer target, return true if target is in matrix or false otherwise
# You must write a solution in O(log(m * n)) time complexity.

# Example 1:
# Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
# Output: true

# Example 2:
# Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
# Output: false
 
# Constraints: 
# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 100
# -10^4 <= matrix[i][j], target <= 10^4

# Plan:
# 1. We will treat the 2D matrix as a 1D array.
# 2. We will calculate the number of rows and columns in the matrix.
# 3. We will perform binary search on the 1D representation of the matrix.
# 4. If we find the target, we will return true; otherwise, we will return false.
# 5. The time complexity is O(log(m * n)) due to the binary search.
# 6. The space complexity is O(1) since we are not using any additional data structures.

def search_matrix(matrix, target)
  return false if matrix.empty? || matrix[0].empty? # can't run a search on something that is empty 

  rows = matrix.length # we set this to the number of rows in the matrix by calling the length method on the matrix
  cols = matrix[0].length # we set this to the number of columns in the matrix by calling the length method on the first row of the matrix, that way we're making a square matrix
  left, right = 0, rows * cols - 1 # treat the 2D matrix as a 1D array, with rows * cols being the total number of elements, similar to arr.length - 1

  while left <= right
    mid = left + (right - left) / 2 # find the mid index
    mid_value = matrix[mid / cols][mid % cols] # convert 1D index back to 2D index to get the value

    if mid_value == target # if the mid value is equal to the target, we return true
      return true
    elsif mid_value < target # if the mid value is less than the target, we search the right half
      left = mid + 1
    else
      right = mid - 1
    end # we keep iterating until we find the target OR until we return false as it's missing
  end

  false # target not found
end