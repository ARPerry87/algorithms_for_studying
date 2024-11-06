# Leetcode link: https://leetcode.com/problems/spiral-matrix/
# Description: Given an m x n matrix, return all elements of the matrix in spiral order.
# 
# Example 1:
# Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
# Output: [1,2,3,6,9,8,7,4,5]
# 
# Example 2:
# Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
# Output: [1,2,3,4,8,12,11,10,9,5,6,7]
# 
# Constraints:
# m == matrix.length
# n == matrix[i].length
# 1 <= m, n <= 10
# -100 <= matrix[i][j] <= 100

# Solution 1: Using while loop
 
# We want to iterate in a way that we go through the matrix in a spiral order.
# To do this we need to keep track of the start and end indices of the rows and columns.
# We will iterate through the matrix in a spiral order and add the elements to the results array.
# We will increment the start row index and decrement the end row index after each iteration.
# We will increment the start column index and decrement the end column index after each iteration.
# We will return the results array at the end.
# Time complexity: O(m * n) where m is the number of rows and n is the number of columns in the matrix
# Space complexity: O(1)
 
# @param {Integer[][]} matrix
# @return {Integer[]}

def spiral_order(matrix)
  return [] if matrix.empty? # return an empty array if the matrix is empty

  result = [] # create a results array 
  r_start, r_end = 0, matrix.length - 1 # initialize the start and end row indices
  c_start, c_end = 0, matrix[0].length - 1 # initialize the start and end column indices

  while r_start <= r_end && c_start <= c_end # while the start row index is less than or equal to the end row index and the start column index is less than or equal to the end column index
    c_start.upto(c_end) do |i| # iterate through the start column index to the end column index
      result << matrix[r_start][i] # add the element at the start row index and the current column index to the results array
    end
    r_start += 1 # increment the start row index
 
    r_start.upto(r_end) do |i| # iterate through the start row index to the end row index
      result << matrix[i][c_end] # add the element at the current row index and the end column index to the results array
    end
    c_end -= 1 # decrement the end column index

    if r_start <= r_end # if the start row index is less than or equal to the end row index
      c_end.downto(c_start) do |i| # iterate through the end column index to the start column index
        result << matrix[r_end][i] # add the element at the end row index and the current column index to the results array
      end
      r_end -= 1 # decrement the end row index
    end

    if c_start <= c_end # if the start column index is less than or equal to the end column index
      r_end.downto(r_start) do |i| # iterate through the end row index to the start row index
        result << matrix[i][c_start] # add the element at the current row index and the start column index to the results array
      end
      c_start += 1 # increment the start column index
    end
  end
  result
end

# Solution 2: Using pop and shift methods

# We want to iterate in a way that we go through the matrix in a spiral order.

def spiral_order(matrix)
  return [] if matrix.empty? # return an empty array if the matrix is empty

  result = [] # create a results array

  while matrix.any? # while the matrix is not empty
    result.concat(matrix.shift.compact) # add the first row of the matrix to the results array, removing nil values
    break if matrix.empty? # break if the matrix is empty
    matrix.each { |row| result << row.pop unless row.empty? || row.last.nil? } # add the last element of each row to the results array, removing nil values
    result.concat(matrix.pop.reverse.compact) # add the last row of the matrix in reverse order to the results array, removing nil values
    break if matrix.empty? # break if the matrix is empty
    matrix.reverse.each { |row| result << row.shift unless row.empty? || row.first.nil? } # add the first element of each row in reverse order to the results array, removing nil values
  end
  result
end