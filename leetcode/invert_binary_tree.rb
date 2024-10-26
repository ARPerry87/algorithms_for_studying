def invert_tree(root)
  return if root.nil?

  root.right, root.left = invert_tree(root.left), invert_tree(root.right)
  root
end