# Leetcode link: https://leetcode.com/problems/merge-intervals/
# Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals.
# Example 1:
# Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
# Example 2:
# Input: intervals = [[1,4],[4,5]]
# Output: [[1,5]]
# Explanation: Intervals [1,4] and [4,5] are considered overlapping.

# # Solution:

def merge(intervals)
  #we want to first check if the array is empty, if it is, then return an empty array
  return [ ] if intervals.empty?
  # we then want to sort the array by the first element of each interval
  intervals.sort_by!{ |interval| interval[0] }
  # we want to initialize a result array with the first interval
  result = [intervals[0]]
  # we want to iterate through the array starting from the second interval
  # we start at the second interval because we already have the first interval in the result array
  intervals[1..-1].each do |interval|
    # if the interval at the first index is less than or equal to the last element of the result array
    if interval[0] <= result[-1][1]
      # we want to take the maximum of the last element of the result array and the last element of the current interval
      result[-1][1] = [result[-1][1], interval[1]].max
    else
      # else we want to append the interval to the result array
      result << interval
    end
  end
  # we want to return the result array
  result
end