# learn this dammit learn it

# Breadth First Search
# 1. Create a queue and a visited array
# 2. Add the starting node to the queue
# 3. While the queue is not empty, do the following:
#   a. Pop the first node from the queue
#   b. If the node has not been visited, visit it and add it to the visited array
#   c. Add all of the node's neighbors to the queue
#   d. Repeat
#   e. If the queue is empty, you're done
#   f. If the target node is found, return the number of steps it took to find it
#   g. If the target node is not found, return -1
#   h. Profit

graph = {
  'A' => ['B', 'C'],
  'B' => ['D'],
  'C' => ['E'],
  'D' => [],
  'E' => []
}

def bfs(graph, start)
  visited = {}
  queue = [start]

  while queue.any?
    node = queue.shift
    next if visited[node]
    puts node
    visited[node] = true
    queue += graph[node]
  end
end

puts "BFS Traversal"
bfs(graph, 'A')