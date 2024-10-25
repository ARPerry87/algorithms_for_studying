# This is a template for traversing a Binary Search Tree
# This will assume a Node class is defined with left and right children already 

def solution(root)
  result = [] # initialize an empty array to hold the result
  traverse_in_order(root, result) # start the in-order traversal
  result # return the final result
end

def traverse_in_order(node, result)
  return if node.nil? # base case: if the node is nil, return

  traverse_in_order(node.left, result) # recursively traverse the left subtree
  result << node.value # process the current node
  traverse_in_order(node.right, result) # recursively traverse the right subtree
end