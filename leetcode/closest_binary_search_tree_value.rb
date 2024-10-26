# Leetcode link: https://leetcode.com/problems/closest-binary-search-tree-value/

# Problem: Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target.
# Example 1:
# Input: root = [4,2,5,1,3], target = 3.7142857142857144
# Output: 4
# Explanation: The closest value to 3.7142857142857144 in the BST is 4.

# Plan:
# 1. We will perform a binary search on the BST.
# 2. We will keep track of the closest value found so far.
# 3. At each node, we will compare the current node's value with the target.
# 4. If the current node's value is closer to the target than the closest value found so far, we will update the closest value.
# 5. We will then decide whether to go left or right based on the target value.
# 6. If the target is less than the current node's value, we will go left; otherwise, we will go right.
# 7. We will continue this process until we reach a leaf node.
# 8. Finally, we will return the closest value found.
# 9. The time complexity is O(h), where h is the height of the tree.
# 10. The space complexity is O(1) since we are not using any additional data structures.

def closest_value(root, target)
  res = root.val
  closest = Float::INFINITY
  while root do
      curr_diff = (root.val - target).abs

      if curr_diff <= closest
          if curr_diff == closest
              prev_node = res
              curr_node = root.val
              res = res < curr_node ? prev_node : curr_node
          else
              res = root.val
              closest = curr_diff
          end
      end

      return res if res == target

      root = root.val < target ? root.right : root.left 
  end

  res
end

# Example usage:
# root = TreeNode.new(4, TreeNode.new(2, TreeNode.new(1), TreeNode.new(3)), TreeNode.new(5))
# target = 3.5
# puts closest_value(root, target) # Output should be 3