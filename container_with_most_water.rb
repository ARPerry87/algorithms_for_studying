# Leetcode link: https://leetcode.com/problems/container-with-most-water/
# Problem: Given n non-negative integers a1, a2, ..., an , where each represents a point at coordinate (i, ai). n vertical lines are drawn such that the two endpoints of the line i is at (i, ai) and (i, 0). Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.
 
# Notice that you may not slant the container.
# This is also a Google Interview Question that has a fairly high use rate.
 
# # Solution

def max_area(height)
  res = []

  # height is just an array, so we can use two pointers to solve this problem
  # we will use two pointers to traverse the array from left and right
  # the left pointer is the start of the array
  # the right pointer is the end of the array (hence the height.length - 1)

  l, r = 0, height.length - 1

  # like with all two pointers we want to iterate through the array 
  # as long as left is less than our right pointer
  # we want left to be less than right because we want to make sure we are not going out of bounds

  while l < r
    # we calculate the area by multiplying the minimum of the two heights by the distance between the two pointers
    area = [height[l], height[r]].min * (r - l)
    # we then add the area to our res array
    res << area
    # we then check if the left height is less than the right height
    if height[l] < height[r]
      # if it is we increment the left pointer
      l += 1
    else
      # if it isn't we decrement the right pointer
      r -= 1
    end
  end
  # we then return the maximum area from our res array
  res.max
end