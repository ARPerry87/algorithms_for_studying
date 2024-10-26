# Leetcode https://leetcode.com/problems/trapping-rain-water/
# Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it can trap after raining.
# 
# Example 1:
# Input: height = [0,1,0,2,1,0,1,3,2,1,2,1]
# Output: 6
# Explanation: The above elevation map (black section) is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped.

# Solution:

# we want to use a two pointer approach to solve this problem
# we want to create two pointers, left and right, and initialize them to 0 and the length of the height array - 1 respectively
# we want to create two variables, left_max and right_max, and initialize them to 0

def trap(height)
  l, r = 0, height.lenght - 1
  left_max, right_max = 0, 0
  result = 0

  while l < r
    if height[l] < height[r]
      if height[l] >= left_max
        left_max = height[l]
      else
        result += left_max - height[l]
      end
      l += 1
    else
      if height[r] >= right_max
        right_max = height[r]
      else
        result += right_max - height[r]
      end
      r -= 1
    end
  end
  result
end