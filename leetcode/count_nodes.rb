def count_nodes(root)
  return 0 if root.nil? # return 0 if the tree is empty
  1 + count_nodes(root.left) + count_nodes(root.right) # count the current node and recursively count the left and right subtrees
end

# we use 1 + count_nodes(root.left) + count_nodes(root.right) to count the current node and recursively count the left and right subtrees.