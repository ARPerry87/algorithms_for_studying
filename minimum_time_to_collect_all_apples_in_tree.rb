# Leetcode link: https://leetcode.com/problems/minimum-time-to-collect-all-apples-in-a-tree/
# Given an undirected tree consisting of n vertices numbered from 0 to n-1, which has some apples in their vertices. You spend 1 second to walk over one edge of the tree. Return the minimum time in seconds you have to spend to collect all apples in the tree, starting at vertex 0 and coming back to this vertex.
# 
# The edges of the undirected tree are given in the array edges, where edges[i] = [ai, bi] means that exists an edge connecting the vertices ai and bi. Additionally, there is a boolean array hasApple, where hasApple[i] = true means that vertex i has an apple; otherwise, it does not have any apple.

# Example 1:
# n = 7, edges = [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], hasApple = [false,false,true,false,true,true,false]
# Output: 8
# Explanation: The figure above represents the given tree where red vertices have an apple. One optimal path
# 
# Plan:
# Make an adjacency list to represent the tree
# Traverse the tree using Depth First Search
# Create a visited set to keep track of the visited nodes
# Create a helper method to traverse the tree
def min_time(n, edges, has_apple)
  graph = Array.new(n) { [] }
  # create an adjacency list to represent the tree
  edges.each do |u, v|
    graph[u] << v
    graph[v] << u
  end

  visited = Set.new
  # create a visited set to keep track of the visited nodes
  dfs(0, graph, visited, has_apple)
end

def dfs(node, graph, visited, has_apple)
  return 0 if visited.include?(node)
  visited << node
  time = 0
  # we iterate through the children of the node and add the time taken to traverse the tree to the time variable
  graph[node].each do |child|
    time += dfs(child, graph, visited, has_apple)
  end
  # if the node is not the root node and it has an apple or any of its children has an apple, we add 2 seconds to the time variable
  if (node != 0 && (has_apple[node] || time > 0))
    time += 2
  end
  time
end

# or again with dfs method

def min_time(n, edges, has_apple)
  adj = Hash.new { |hash, key| hash[key] = [] } # create an adjacency list to represent the tree and initialize it with an empty array if the key does not exist
  (0...n).each { |i| adj[i] } # ensure all nodes are in the adjacency list, even if they do not have any children

  for par, child in edges # populate the adjacency list with the edges, for each child it will add the parent and for each parent it will add the child, making it bidirectional
    adj[par] << child
    adj[child] << par
  end

  # Pass has_apple as a parameter to dfs
  def dfs(cur, par, adj, has_apple) # create a helper method to traverse the tree
    time = 0 # initialize the time variable to 0

    for child in adj[cur] # iterate through the children of the current node
      if child == par # if the child is the parent, skip to the next child as do not want to create a cycle
        next
      end
      child_time = dfs(child, cur, adj, has_apple) # recursively call the dfs method on the child node, passing the child node as the current node and the current node as the parent node
      if child_time > 0 || has_apple[child] # if the child has an apple or the child time is greater than 0, add 2 seconds to the time variable
        time += 2 + child_time # add 2 seconds to the time variable
      end
    end
    return time # return the time variable
  end

  dfs(0, -1, adj, has_apple) # call the dfs method with the root node, -1 as the parent node, the adjacency list, and the has_apple array
end