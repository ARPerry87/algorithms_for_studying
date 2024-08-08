def count_nodes(root)
  return 0 if root.nil?
  1 + count_nodes(root.left) + count_nodes(root.right) 
end