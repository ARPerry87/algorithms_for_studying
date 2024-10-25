# Template for Union Find in algorithm problems - this one is very seldomly asked
# Union Find is used for problems involving connected components in graphs

def initialize(n)
  @parent = Array.new(n) { |i| i } # initialize the parent array
  @rank = Array.new(n, 1) # initialize the rank array
end

def find(x)
  if @parent[x] != x # if x is not its own parent
    @parent[x] = find(@parent[x]) # path compression
  end
  @parent[x] # return the root parent
end

def union(x, y)
  root_x = find(x) # find the root of x
  root_y = find(y) # find the root of y

  return if root_x == root_y # if they are already in the same set

  # union by rank
  if @rank[root_x] < @rank[root_y]
    @parent[root_x] = root_y
  elsif @rank[root_x] > @rank[root_y]
    @parent[root_y] = root_x
  else
    @parent[root_y] = root_x
    @rank[root_x] += 1
  end
end

def connected(x, y)
  find(x) == find(y) # check if x and y are in the same set
end

# Example usage:
# uf = UnionFind.new(10) # create a UnionFind object with 10 elements
# uf.union(1, 2) # union elements 1 and 2
# uf.connected(1, 2) # check if elements 1 and 2 are connected
# uf.find(1) # find the root of element 1
# uf.find(2) # find the root of element 2
# uf.union(2, 3) # union elements 2 and 3
# uf.connected(1, 3) # check if elements 1 and 3 are connected
# uf.find(3) # find the root of element 3
# uf.union(1, 3) # union elements 1 and 3
# uf.connected(1, 2) # check if elements 1 and 2 are connected
# uf.connected(2, 3) # check if elements 2 and 3 are connected
# etc. 