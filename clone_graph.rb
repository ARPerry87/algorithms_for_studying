# Leetcode link: https://leetcode.com/problems/clone-graph/
# Description: Given a reference of a node in a connected undirected graph.
# Return a deep copy (clone) of the graph.
# Each node in the graph contains a val (int) and a list (List[Node]) of its neighbors.
# class Node
#   attr_accessor :val, :neighbors
#   def initialize(val = 0, neighbors = [])
#     @val = val
#     @neighbors = neighbors
#    end
# end

# Solution:

def cloneGraph(node)
  return nil if node.nil?
  # we want to create a hash to store the nodes that we've visited
  visited = {}
  # we want to create a queue to store the nodes that we want to visit
  queue = []
  # we want to create a new node with the value of the input node
  clone = Node.new(node.val)
  # we want to store the input node in the visited hash
  visited[node] = clone
  # we want to store the input node in the queue
  queue << node
  # we want to loop through the queue until it's empty
  while !queue.empty?
    # we want to remove the first node from the queue
    current = queue.shift
    # we want to loop through the neighbors of the current node
    current.neighbors.each do |neighbor|
      # if the neighbor is not in the visited hash
      if !visited[neighbor]
        # we want to create a new node with the value of the neighbor
        clone_neighbor = Node.new(neighbor.val)
        # we want to store the neighbor in the visited hash
        visited[neighbor] = clone_neighbor
        # we want to store the neighbor in the queue
        queue << neighbor
      end
      # we want to add the neighbor to the neighbors of the current node
      visited[current].neighbors << visited[neighbor]
    end
  end
  # we want to return the clone of the input node
  clone
end

# using dfs

def cloneGraph(node)
  return nil if node.nil?
  
  # Hash to store visited nodes
  visited = {}
  
  # Helper function to perform DFS
  def dfs(node, visited)
    # return the node if we've already visited it so we don't create a new node
    return visited[node] if visited[node]
    
    # Clone the node
    clone = Node.new(node.val)
    # set the visited node to the clone
    visited[node] = clone
    
    # Iterate through the neighbors of the node and perform DFS to find if the neighbors have been visited
    # If they have, we'll return the visited node
    # If they haven't, we'll create a new node and store it in the visited hash
    # We'll then add the neighbor to the neighbors of the clone
    node.neighbors.each do |neighbor|
      clone.neighbors << dfs(neighbor, visited)
    end
    
    # Return the clone
    clone
  end
  
  # Start DFS from the given node
  dfs(node, visited)
end