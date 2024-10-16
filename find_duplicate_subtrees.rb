# Leetcode link: https://leetcode.com/problems/find-duplicate-subtrees/
# Description: Given the root of a binary tree, return all duplicate subtrees. For each kind of duplicate subtrees, you only need to return the root node of any one of them.
# Two trees are duplicate if they have the same structure with the same node values.
# Example 1:
# Input: root = [1,2,3,4,null,2,4,null,null,4]
# Output: [[2,4],[4]]
# Example 2:
# Input: root = [2,1,1]
# Output: [[1]]
# Example 3:
# Input: root = [2,2,2,3,null,3,null]
# Output: [[2,3],[3]]
# Constraints:
# The number of the nodes in the tree will be in the range [1, 10^4]
# -200 <= Node.val <= 200
 
#Solution:

# we want to initialize the hash and the result
# we want to create a helper method that takes in the root, the hash, and the result
# we want to return the result at the end
# the time complexity is O(n) where n is the number of nodes in the tree

def find_duplicate_subtrees(root)
  hash = {}
  result = []
  helper(root, hash, result)
  result
end

def helper(root, hash, result)
  return nil if root.nil?
  left = helper(root.left, hash, result)
  right = helper(root.right, hash, result)
  key = "#{root.val},#{left},#{right}"
  if hash[key]
    result.push(root) if hash[key] == 1
    hash[key] += 1
  else
    hash[key] = 1
  end
  key
end