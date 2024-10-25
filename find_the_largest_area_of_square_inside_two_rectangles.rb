# Leetcode https://leetcode.com/problems/find-the-largest-area-of-square-inside-two-rectangles/
# Description: 
# There exist n rectangles in a 2D plane with edges parallel to the x and y axis. 
# You are given two 2D integer arrays bottomLeft and topRight 
# where bottomLeft[i] = [a_i, b_i] and topRight[i] = [c_i, d_i] represent the bottom-left and top-right coordinates of the ith rectangle, respectively.

# You need to find the maximum area of a square that can fit inside the intersecting region of at least two rectangles. Return 0 if such a square does not exist.
 
# Example 1:
# Input: bottomLeft = [[1,1],[2,2],[3,1]], topRight = [[3,3],[4,4],[6,6]]
# Output: 1
# Explanation:
# A square with side length 1 can fit inside either the intersecting region of rectangles 0 and 1 or the intersecting region of rectangles 1 and 2. Hence the maximum area is 1. It can be shown that a square with a greater side length can not fit inside any intersecting region of two rectangles.

# Example 2:
# Input: bottomLeft = [[1,1],[1,3],[1,5]], topRight = [[5,5],[5,7],[5,9]]
# Output: 4
# Explanation:
# A square with side length 2 can fit inside either the intersecting region of rectangles 0 and 1 or the intersecting region of rectangles 1 and 2.
# Hence the maximum area is 2 * 2 = 4. It can be shown that a square with a greater side length can not fit inside any intersecting region of two rectangles.

# Plan:
# 1. Initialize a variable max_area to 0
# 2. Iterate through the bottomLeft and topRight arrays
# 3. For each rectangle, calculate the area of the intersecting region
# 4. If the area is greater than max_area, update max_area
# 5. Return max_area
# Time complexity: O(n) where n is the number of rectangles
# Space complexity: O(1)

def largest_square_area(bottom_left, top_right)
  max_area = 0 # initialize the maximum area to 0
  (0...bottom_left.length).each do |i| # iterate through the arrays from 0 to the length of the bottom_left array
    (i + 1...bottom_left.length).each do |j| # then iterate through the array from i + 1 to the length of the bottom_left array, to compare the rectangles
      x1 = [bottom_left[i][0], bottom_left[j][0]].max # calculate the x and y coordinates of the intersecting region
      y1 = [bottom_left[i][1], bottom_left[j][1]].max # by taking the maximum of the bottom left coordinates
      x2 = [top_right[i][0], top_right[j][0]].min # and the minimum of the top right coordinates
      y2 = [top_right[i][1], top_right[j][1]].min # to get the intersecting region
      side = [x2 - x1, y2 - y1].min # calculate the side of the square by taking the minimum of the difference between the x and y coordinates
      if side > 0 # if the side is greater than 0
        max_area = [max_area, side * side].max # update the maximum area to the maximum of the current maximum area and the area of the square
      end
    end
  end
  max_area
end