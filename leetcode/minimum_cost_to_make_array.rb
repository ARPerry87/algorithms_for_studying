# Leetcode https://leetcode.com/problems/minimum-cost-to-make-array-equal/
# You are given two 0-indexed arrays nums and cost consisting each of n positive integers.

# You can do the following operation any number of times:

#   Increase or decrease any element of the array nums by 1.
#   The cost of doing one operation on the ith element is cost[i].
  
#   Return the minimum total cost such that all the elements of the array nums become equal.
  
# Example 1: 
# nums = [1,3,5,2], cost = [2,3,1,14]
# Output: 8
# Explanation: We can make all the elements equal to 2 in the following way:
# - Increase the 0th element one time. The cost is 2.
# - Decrease the 1st element one time. The cost is 3.
# - Decrease the 2nd element three times. The cost is 1 + 1 + 1 = 3.
# The total cost is 2 + 3 + 3 = 8.
# It can be shown that we cannot make the array equal with a smaller cost.

# Plan:
# 1. Initialize a variable min_cost to 0 
# 2. Iterate through the array and find the minimum cost

def min_cost(nums, cost)
  min_cost = Float::INFINITY # initialize the minimum cost to infinity

  left, right = nums.min, nums.max # initialize left and right to the minimum and maximum of the array
  while left <= right # while left is less than or equal to right
    mid = (left + right) / 2 # set mid to the average of left and right
    cost1 = nums.each_with_index.sum { |num, i| (num - mid).abs * cost[i] } # calculate the cost of making all the elements equal to mid
    cost2 = nums.each_with_index.sum { |num, i| (num - (mid + 1)).abs * cost[i] } # calculate the cost of making all the elements equal to mid + 1
    
    min_cost = [min_cost, cost1, cost2].min # set the minimum cost to the minimum of the current minimum cost, cost1, and cost2
    
    if cost1 < cost2 # if cost1 is less than cost2
      right = mid - 1 # set right to mid - 1
    else
      left = mid + 1 # otherwise, set left to mid + 1
    end
  end

  min_cost
end
  