# Leetcode link: https://leetcode.com/problems/minimum-absolute-difference/
# Description: Given an array of distinct integers arr, find all pairs of elements with the minimum absolute difference of any two elements. Return a list of pairs in ascending order(with respect to pairs), each pair [a, b] follows
# a, b are from arr
# a < b

# Solution:
 
# we want to sort the array
# we want to find the minimum difference between two elements
# we want to iterate through the array and find the pairs with the minimum difference
# we want to return the pairs

def minimum_abs_difference(arr)
  arr.sort!
  min_diff = Float::INFINITY
  res = []

  for i in 1...arr.size
    curr = (arr[i] - arr[i - 1]).absolute
    if curr < min_diff
      min_diff = cur
      res = [[arr[i - 1], arr[i]]]
    elsif curr == min_diff
      res.append([arr[i - 1], arr[i]])
    else
      next
    end
  end
  return res
end