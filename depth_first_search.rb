#ruby has no built in class for intitalizing a Binary Tree, so we need to make it. 
#Tree is just a rstricted form of a graph, so we can use the graph class to make a tree

class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

# now build a tree as an example

root = Node.new(3)
child_l = Node.new(9)
child_r = Node.new(20)

grand_child_r_l = Node.new(15)
grand_child_r_r = Node.new(7)
grand_child_l_l = Node.new(1)

child_r.left = grand_child_r_l
child_r.right = grand_child_r_r
child_l.left = grand_child_l_l

root.right = child_r
root.left = child_l

# now we can do a depth first search on this tree
#

def depth_first_search(node)
  p node.value

  children = [node.left, node.right].compact

  children.each do |child|
    depth_first_search(child)
  end
end

depth_first_search(root)

# this will print out the values of the nodes in the tree in depth first order
# now lets do breadth first

def breadth_first_search(node)
  queue = []
  queue.push(node)

  while !queue.size = 0
    node = queue.shift 
    p node.value

    children = [node.left, node.right].compact

    children.each do |child|
      queue.push(child)
    end
  end
end

breadth_first_search(root)

# now let's do maximum depth of binary tree 

def maximum_depth(root)
  return 0 if root.nil?

  queue = [root]
  depth = 0

  while !queue.empty?
    for i in 0..queue.length - 1
      node = queue.shift
      queue.push(node.left) if node.left
      queue.push(node.right) if node.right
    end
    depth += 1
  end
  depth
end

