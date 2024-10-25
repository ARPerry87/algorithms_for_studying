# A template for using DFS algorithm to traverse a graph or tree

def dfs(node)
  visited = Set.new # create a set to keep track of visited nodes
  dfs_helper(node, visited) # call the helper function to start the DFS
end

def dfs_helper(node, visited)
  return if visited.include?(node) # return if the node has already been visited

  visited.add(node) # mark the node as visited
  puts node # process the node (e.g., print it)

  node.neighbors.each do |neighbor| # iterate through each neighbor of the node
    dfs_helper(neighbor, visited) # recursively call dfs_helper for each neighbor
  end
end

# Example usage:
# Assuming you have a graph represented as a set of nodes with neighbors
# dfs(start_node) # start the DFS traversal from the start_node
# Note: Make sure to require 'set' if you're using Ruby's Set class. 
# You can