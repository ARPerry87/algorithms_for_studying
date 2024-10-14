# Leetcode link: https://leetcode.com/problems/number-of-islands/
# Description: Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
# Example 1:
# Input:
# 11110
# 11010
# 11000
# 00000
# Output: 1
# Example 2:
# Input:
# 11000
# 11000
# 00100
# 00011
# Output: 3

# Solution:

def num_islands(grid)
  return 0 if grid.empty?
  m = grid.size
  n = grid[0].size
  count = 0
  
  (0...m).each do |i|
    (0...n).each do |j|
      if grid[i][j] == '1'
        dfs(grid, i, j)
        count += 1
      end
    end
  end
  count
end

def dfs(grid, i, j)
  return if i < 0 || i >= grid.size || j < 0 || j >= grid[0].size || grid[i][j] == '0'
  
  grid[i][j] = '0'
  
  dfs(grid, i + 1, j)
  dfs(grid, i - 1, j)
  dfs(grid, i, j + 1)
  dfs(grid, i, j - 1)
end

# using bfs

def num_islands(grid)
  return 0 if grid.empty?
  m = grid.size
  n = grid[0].size
  count = 0
  queue = []
  
  (0...m).each do |i|
    (0...n).each do |j|
      if grid[i][j] == '1'
        count += 1
        queue.push([i, j])
        bfs(grid, queue)
      end
    end
  end
  count
end

def bfs(grid, queue)
  while !queue.empty?
    i, j = queue.shift
    next if i < 0 || i >= grid.size || j < 0 || j >= grid[0].size || grid[i][j] == '0'
    grid[i][j] = '0'
    queue.push([i + 1, j])
    queue.push([i - 1, j])
    queue.push([i, j + 1])
    queue.push([i, j - 1])
  end
end