# Leetcode link: https://leetcode.com/problems/search-a-2d-matrix-ii/

# Write an efficient algorithm that searches for a value target in an m x n integer matrix matrix. This matrix has the following properties:
# Integers in each row are sorted in ascending from left to right.
# Integers in each column are sorted in ascending from top to bottom.

# Example 1:
# Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 5
# Output: true

# Example 2:
# Input: matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]], target = 20
# Output: false

# Constraints:
# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 300
# -10^9 <= matrix[i][j], target <= 10^9
# All the integers in each row are sorted in ascending order
# All the integers in each column are sorted in ascending order
# -10^9 <= target <= 10^9

# Plan:
# 1. We should treat the matrix as a 1d array and perform binary search.
# 2. We will start from the top-right corner of the matrix.
# 3. If the current element is equal to the target, we return true.
# 4. If the current element is greater than the target, we move left.
# 5. If the current element is less than the target, we move down.
# 6. If we go out of bounds, we return false.
# 7. The time complexity is O(m + n) since we are traversing the matrix.
# 8. The space complexity is O(1) since we are not using any additional data structures.

def search_matrix(matrix, target)
  return false if matrix.empty? || matrix[0].empty? # can't run a search on something that is empty 

  rows = matrix.length
  row, col = 0, matrix[0].length - 1 # start from the top-right corner

  while row < rows && col >= 0
    if matrix[row][col] == target
      return true
    elsif matrix[row][col] > target
      col -= 1 # move left
    else
      row += 1 # move down
    end
  end

  false # target not found
end