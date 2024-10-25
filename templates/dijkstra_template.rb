# This is a template on how to implement Dijkstra's algorithm in ruby 
# for finding the shortest path in a graph

require 'priority_queue'

def solution(graph, start)
  distances = {} # initialize a hash to hold the shortest distances from the start node
  graph.keys.each { |node| distances[node] = Float::INFINITY } # set all distances to infinity
  distances[start] = 0 # set the distance to the start node to 0

  priority_queue = PriorityQueue.new # initialize a priority queue
  priority_queue.push(start, 0) # add the start node with distance 0

  until priority_queue.empty? # continue until the priority queue is empty
    current_node, current_distance = priority_queue.delete_min # get the node with the smallest distance

    next if current_distance > distances[current_node] # skip if the current distance is greater than the known distance

    graph[current_node].each do |neighbor, weight| # iterate through each neighbor of the current node
      distance = current_distance + weight # calculate the distance to the neighbor
      if distance < distances[neighbor] # if the calculated distance is less than the known distance
        distances[neighbor] = distance # update the shortest distance
        priority_queue.push(neighbor, distance) # add the neighbor to the priority queue
      end
    end
  end

  distances # return the shortest distances from the start node
end