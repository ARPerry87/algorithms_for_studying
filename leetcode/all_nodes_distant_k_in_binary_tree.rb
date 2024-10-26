# Leetcode link: https://leetcode.com/problems/all-nodes-distance-k-in-binary-tree/
# Description: We are given a binary tree (with root node root), a target node, and an integer value K.
# Return a list of the values of all nodes that have a distance K from the target node. The answer can be returned in any order.

# Example 1:
# Input: root = [3,5,1,6,2,0,8,null,null,7,4], target = 5, K = 2 
# Output: [7,4,1]
# Explanation: The nodes that are a distance 2 from the target node (with value 5)
# have values 7, 4, and 1.

# Note that the inputs "root" and "target" are actually TreeNodes.
# The descriptions of the inputs above are just serializations of these objects.
# Plan:
# use Breadth First Search to traverse the tree and create a graph hash
# 

def distance_k(root, target, k)
  @parent = {}
  # key: current node, value: parent node
  # Since, it is given that all the values are unique, we can save some space and make key as node.val else we can use node as the key as well.  
  # find parent for each child using preorder traversal
  preorder_traversal(root, nil)

  queue = []
  queue << target
  visited = Set.new
  result = []

  while !queue.empty? && k > 0
      k -= 1
      queue.size.times do
          curr = queue.shift
          parent_node = @parent[curr]
          visited << curr

          if !parent_node.nil? && !visited.include?(parent_node)
              queue << parent_node
          end
          if !curr.left.nil? && !visited.include?(curr.left)
              queue << curr.left
          end
          if !curr.right.nil? && !visited.include?(curr.right)
              queue << curr.right
          end
      end
  end

  while !queue.empty?
      curr = queue.shift
      result << curr.val
  end
  result
end

def preorder_traversal(curr, parent)
  return if curr.nil?

  @parent[curr] = parent
  preorder_traversal(curr.left, curr)
  preorder_traversal(curr.right, curr)
end