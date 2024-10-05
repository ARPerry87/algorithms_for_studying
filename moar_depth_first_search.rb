# learn this dammit learn it

# Depth First Search
# 1. Create a stack and a visited array
# 2. Add the starting node to the stack
# 3. While the stack is not empty, do the following:
#  a. Pop the first node from the stack
#  b. If the node has not been visited, visit it and add it to the visited array
#  c. Add all of the node's neighbors to the stack
#  d. Repeat
#  e. If the stack is empty, you're done
#  f. If the target node is found, return the number of steps it took to find it
#  g. If the target node is not found, return -1
#  h. Profit

graph = {
  'A' => ['B', 'C'],
  'B' => ['D'],
  'C' => ['E'],
  'D' => [],
  'E' => []
}

def dfs(graph, start, visited={})
  return if visited[start]

  puts start 
  visited[start] = true
  graph[start].each{|vertex| dfs(graph, vertex, visited)}
end

puts "DFS Traversal"
dfs(graph, 'A')