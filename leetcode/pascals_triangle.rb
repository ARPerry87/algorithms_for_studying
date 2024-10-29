# Leetcode link: https://leetcode.com/problems/pascals-triangle/
# Given an integer numRows, return the first numRows of Pascal's triangle.
# In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

# Example 1:
# Input: numRows = 5
# Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 
# Example 2:
# Input: numRows = 1
# Output: [[1]]

# Plan:
# 1. We will create an array to hold the rows of Pascal's triangle.
# 2. We will iterate from 0 to numRows - 1 to create each row.
# 3. For each row, we will create an array to hold the values of that row.
# 4. The first and last elements of each row will be 1.
# 5. For the elements in between, we will calculate the value as the sum of the two elements directly above it.
# 6. We will append each row to the main array.
# 7. The time complexity is O(numRows^2) and the space complexity is O(numRows).
# 8. Let's implement the solution.

def generate(numRows)
  triangle = []

  (0...numRows).each do |row|
    current_row = Array.new(row + 1, 1) # Initialize the current row with 1s

    (1...row).each do |col|
      current_row[col] = triangle[row - 1][col - 1] + triangle[row - 1][col] # Calculate the value based on the two numbers above
    end

    triangle << current_row # Append the current row to the triangle
  end

  triangle
end