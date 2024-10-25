# A BFS template for traversing a graph or tree

def bfs(root)
  return if root.nil? # return if the root is nil
  queue = [root] # initialize the queue with the root node
  visited = Set.new # create a set to keep track of visited nodes

  until queue.empty? # continue until the queue is empty
    node = queue.shift # dequeue the front node
    next if visited.include?(node) # skip if the node has already been visited

    visited.add(node) # mark the node as visited
    puts node # process the node (e.g., print it)

    node.neighbors.each do |neighbor| # iterate through each neighbor of the node
      queue << neighbor unless visited.include?(neighbor) # enqueue unvisited neighbors
    end
  end
end