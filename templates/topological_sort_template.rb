# This will serve as a template for topological sort algorithm problems

def solution(graph)
  result = [] # initialize an empty array to hold the result
  visited = {} # initialize a hash to keep track of visited nodes
  graph.keys.each do |node| # iterate through each node in the graph
    topological_sort_util(node, visited, result, graph) # call the utility function
  end
  result.reverse # return the final result in reverse order
end

def topological_sort_util(node, visited, result, graph)
  return if visited[node] # base case: if the node is already visited, return

  visited[node] = true # mark the node as visited
  graph[node].each do |neighbor| # iterate through each neighbor of the node
    topological_sort_util(neighbor, visited, result, graph) # recurse for the neighbor
  end
  result << node # add the node to the result after visiting all its neighbors
end