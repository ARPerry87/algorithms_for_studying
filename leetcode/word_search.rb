# Leetcode link: https://leetcode.com/problems/word-search/
# Given an m x n grid of characters board and a string word, return true if the word exists on the grid. 
# The word can be constructed from letters of sequentially adjacent cells, 
# where adjacent cells are horizontally or vertically neighboring. 
# The same letter cell may not be used more than once.

# Example 1:
# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCCED"
# Output: true
 
# Example 2:
# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "SEE"
# Output: true
 
# Example 3:
# Input: board = [["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], word = "ABCB"
# Output: false

# Plan:
# 1. We will use Depth First Search (DFS) to explore the grid.
# 2. For each cell, we will check if it matches the current character in the word.
# 3. If it matches, we will mark the cell as visited and recursively check the adjacent cells.
# 4. If we reach the end of the word, we return true.
# 5. If we exhaust all possibilities and do not find the word, we return false.
# 6. The time complexity is O(m * n * 4^k) where k is the length of the word, and the space complexity is O(m * n).

def exist(board, word)
  row = board.length
  col = board[0].length

  # Check if the board contains all characters in the word
  return false unless word.chars.all? { |char| board.flatten.include?(char) }

  visited = Array.new(row) { Array.new(col, false) } # 2D array for visited cells

  (0...row).each do |x|
    (0...col).each do |y|
      return true if dfs(board, word, x, y, 0, visited)
    end
  end

  false # If the word is not found
end

def dfs(board, word, x, y, index, visited)
  return true if index == word.length # If we have found all characters in the word

  return false if x < 0 || x >= board.length || y < 0 || y >= board[0].length || visited[x][y] || board[x][y] != word[index]

  visited[x][y] = true # Mark the cell as visited

  # Explore all four directions: up, down, left, right
  found = dfs(board, word, x + 1, y, index + 1, visited) ||
          dfs(board, word, x - 1, y, index + 1, visited) ||
          dfs(board, word, x, y + 1, index + 1, visited) ||
          dfs(board, word, x, y - 1, index + 1, visited)

  visited[x][y] = false # Unmark the cell for backtracking
  found
end