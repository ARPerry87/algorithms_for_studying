# Leetcode link: https://leetcode.com/problems/lucky-numbers-in-a-matrix/
# Description: Given a m * n matrix of distinct numbers, return all lucky numbers in the matrix in any order.
# A lucky number is an element of the matrix such that it is the minimum element in its row and maximum in its column.

# example 1: 
# Input: matrix = [[3,7,8],[9,11,13],[15,16,17]]
# Output: [15]
# Explanation: 15 is the only lucky number since it is the minimum in its row and the maximum in its column
 
# example 2:
# Input: matrix = [[1,10,4,2],[9,3,8,7],[15,16,17,12]]
# Output: [12]
# Explanation: 12 is the only lucky number since it is the minimum in its row and the maximum in its column.

# Constraints:
# m == mat.length
# n == mat[i].length
# 1 <= n, m <= 50
# 1 <= matrix[i][j] <= 10^5
# All elements in the matrix are distinct.
# Plan:
# 3. Iterate through the matrix and find the minimum element in a row and maximum element in a column
# 4. If the minimum element in a row is equal to the maximum element in a column, add it to the result array
# 5. Return the result array
# Time complexity: O(m * n) where m is the number of rows and n is the number of columns in the matrix
# Space complexity: O(1)

# @param {Integer[][]} matrix
# @return {Integer[]}
def lucky_numbers(matrix)
  result = []
  # create a result array to store the lucky numbers
  
  matrix.each do |row|
  # we want to iterate through the array row by row
    min = row.min # find our minimum in the row
    max = matrix.transpose[row.index(min)].max # find the maximum by transposing, switching rows and columns
    # it will also find the index of the minimum value in the row, and using this index, it accesses the corresponding column in the transposed matrix and finds the maximum value in that column using the max method. 
    result << min if min == max # then we ask if the min and max are the same? If yes, we append the min to the resuls array.
  end
  
  result # return the results
end