# Leetcode link: https://leetcode.com/problems/maximum-number-of-moves-in-a-grid/
# 
# You are given a 0-indexed m x n matrix grid consisting of positive integers.

# You can start at any cell in the first column of the matrix, and traverse the grid in the following way:

# From a cell (row, col), you can move to any of the cells: (row - 1, col + 1), (row, col + 1) and (row + 1, col + 1) 
# such that the value of the cell you move to, should be strictly bigger than the value of the current cell.
# Return the maximum number of moves that you can perform.

# Example 1:
# Input: grid = [[2,4,3,5],[5,4,9,3],[3,4,2,11],[10,9,13,15]]
# Output: 3
# Explanation: We can start at the cell (0, 0) and make the following moves:
# - (0, 0) -> (0, 1).
# - (0, 1) -> (1, 2).
# - (1, 2) -> (2, 3).
# It can be shown that it is the maximum number of moves that can be made.

# Example 2:
# Input: grid = [[1,2,3],[4,5,6],[7,8,9]]
# Output: 0
# Explanation: We can start at any cell in the first column, but we cannot make any moves.

# Constraints:
# m == grid.length
# n == grid[i].length
# 1 <= m, n <= 100
# 1 <= grid[i][j] <= 10^9

# Plan:
# 1. We will use Depth First Search (DFS) to explore the grid.
# 2. For each cell, we will check if we can move to the adjacent cells.
# 3. We will keep track of the maximum number of moves we can make from each cell.
# 4. We will use memoization to avoid recalculating the number of moves for the same cell.
# 5. The time complexity is O(m * n) and the space complexity is O(m * n).

def max_moves(grid)
  row = grid.length
  col = grid[0].length

  memo = Array.new(row) { Array.new(col, -1) } # Initialize memoization array

  max_moves = 0
  (0...row).each do |r|
    max_moves = [max_moves, dfs(grid, r, 0, memo)].max # Start DFS from each cell in the first column
  end

  max_moves
end

def dfs(grid, row, col, memo)
  return memo[row][col] if memo[row][col] != -1 # Return cached result if exists

  max_move = 0
  directions = [[-1, 1], [0, 1], [1, 1]] # Possible moves

  directions.each do |dr, dc|
    new_row, new_col = row + dr, col + dc
    if new_row >= 0 && new_row < grid.length && new_col < grid[0].length && grid[new_row][new_col] > grid[row][col]
      max_move = [max_move, 1 + dfs(grid, new_row, new_col, memo)].max # Recursively calculate moves
    end
  end

  memo[row][col] = max_move # Cache the result
  max_move
end