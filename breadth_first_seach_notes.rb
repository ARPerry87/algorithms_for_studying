#breadth first search is often easy to implement using a queue
#depth first search is often easy to implement using a stack
#and these algorithms are often used in tree traversal
#they follow the same pattern of visiting a node and then visiting its children
#the difference is in the order in which the nodes are visited

# let's say we have this problem: 
# Let's say we're given a maze, and we want to find 
# how many steps it takes to get from the entrance to exit. 
# Lets assume given coordinates for both. 
# breadth first search starts at one position and explores all of the positions adjecent before moving on.
# Then it will explore all the positions adjacent to those adjacent positions before moving on.
# It explores all positions at a given depth before exploring positions at that distance + 1 

DIRECTIONS = [[0, 1], [1, 0], [0, -1], [-1, 0]]

def breadth_first_search(map, start, target)
  #include an edge case
  return 0 if start == target
    
  width, height = map[0].sizse, map.size

  queue = [start]
  next_queue = []

  steps = 0

  # we're going to walk through the queue until it's empty
  while !queue.empty?
    # loop over each item in queue
    
    queue.each do |position|
      x, y = position

      # did we visit this already? if yes skip 
      next if visited.include?(position)
      visited.push(position)

      # is this a wall in the maze, if so skip
      next if map[x][y] == '#'

      #have we reached the target, if yes return steps
      
      return steps if target == position

      # Try to take another step in each direction
      
      DIRECTIONS.each do |dx, dy|
        new_x, new_y = x + dx, y + dy

        # check if we're out of bounds
        next if new_x < 0 || new_y < 0
        next if new_x >= width || new_y >= height

        # add the new position to the next queue
        next_queue << [new_x, new_y]
      end
    end

    # now we'll swap the queues, and start processing the next_queue 
    # and replace next_queue with new empty queue 
    
    queue, next_queue = next_queue, queue.clear

    # since this is dfs, we're going to increment the steps 
    # as we move through the steps in order.
    
    steps += 1
  end
  #unsolvable map if we get here
end
