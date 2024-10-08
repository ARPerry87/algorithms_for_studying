# Leetcode link: https://leetcode.com/problems/construct-binary-tree-from-string/
# 
# Problem: You need to construct a binary tree from a string consisting of parenthesis and integers.
# The whole input represents a binary tree. It contains an integer followed by zero, one or two pairs of parenthesis.
# The integer represents the root's value and a pair of parenthesis contains a child binary tree with the same structure.
# You always start to construct the left child node of the parent first if it exists.

#solution 

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {String}

def tree2str(root)
  #we need to check if the root is nil 
  #if it is we return an empty string
  #if it isn't we check if the left and right nodes are nil
  #if they are we return the root value
  # then we check if the right node is nil
  # if it is we return the root value and the left node
  return "" if root.nil?
  res = []
  res << root.val.to_s
  left = tree2str(root.left)
  right = tree2str(root.right)
  if left == "" && right == ""
    return res.join("")
  elsif right == ""
    return res.join("") + "(" + left + ")"
  else 
    return res.join("") + "(" + left + ")" + "(" + right + ")"
  end
  return res.join("")
end