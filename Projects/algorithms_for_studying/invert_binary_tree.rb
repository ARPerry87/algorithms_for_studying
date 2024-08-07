def invert_tree(head)
  return unless head 

  head.right = invert_tree(head.left)
  head.left = invert_tree(head.right)
  head
end