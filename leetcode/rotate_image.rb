# Leetcode https://leetcode.com/problems/rotate-image/
# You are given an n x n 2D matrix representing an image, rotate the image by 90 degrees (clockwise).

# You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. 
# DO NOT allocate another 2D matrix and do the rotation.

# Eample 1: 
# Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
# Output: [[7,4,1],[8,5,2],[9,6,3]]

# Example 2:
# Input: matrix = [[1,2],[3,4]]
# Output: [[3,1],[4,2]]

# Plan:
# 1. We will first transpose the matrix.
# 2. Then we will reverse each row of the transposed matrix.
# 3. The time complexity is O(n^2) and the space complexity is O(1).

def rotate(matrix)
  n = matrix

  # Transpose the matrix
  # Swap matrix[i][j] with matrix[j][i]
  # Iterate through the matrix
  # Only need to iterate through the upper triangle of the matrix
  # to avoid swapping back
  # i.e. for each i, j where j > i
  # This will give us the transposed matrix
  
  (0...n.length).each do |i| # iterate through our rows by going from 0 index to n.length
    (i...n.length).each do |j| # iterate through our columns by going from i index to n.length which we do to avoid swapping back
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j] # swap the elements
    end
  end

  # Reverse each row of the transposed matrix
  # This will give us the rotated matrix
  # Iterate through each row and reverse it
  
  matrix.each do |row| # iterate through each row
    row.reverse! # reverse the row in place
  end

  matrix
end

def rotate(matrix)
  n = matrix 

  (0...n.length).each do |i|
    (i...n.length).each do |j|
      matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
    end
  end

  matrix.each do |row|
    row.reverse!
  end

  matrix
end