def right_side_view(root)
  result = []

  return result if root.nil?

  dfs = ->(node, level) do
    return if node.nil?

    if level == result.length
      result.push(node.val)
    end

    dfs.call(node.right, level + 1)
    dfs.call(node.left, level + 1)
  end

  dfs.call(root, 0)
  result
end

# different solution 
# 
def right_side_view(root)
  return [] if !root
    
  view = []
  stack = [[root, 0]]
  while (n, depth = stack.pop)
      if depth >= view.size
          view << n.val
      else
          view[depth] = n.val
      end

      stack << [n.right, depth + 1] if n.right
      stack << [n.left, depth + 1] if n.left
  end
  view

end
