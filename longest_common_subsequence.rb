# Leetcode link: https://leetcode.com/problems/longest-common-subsequence/
# Description: Given two strings text1 and text2, return the length of their longest common subsequence.
# A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.
# If there is no common subsequence, return 0.
# Example 1:
# Input: text1 = "abcde", text2 = "ace"
# Output: 3
# Explanation: The longest common subsequence is "ace" and its length is 3.
# Example 2:
# Input: text1 = "abc", text2 = "def"
# Output: 0
# Explanation: There is no such common subsequence, so the result is 0.
# Note:
# 1 <= text1.length <= 1000
# 1 <= text2.length <= 1000
# The input strings consist of lowercase English characters only.

# # Solution:
 
def longest_common_subsequence(text1, text2)
  # create a 2D array to store the length of the longest common subsequence
  # we're going to use dynamic programming to solve this problem
  # the idea is to build a graph or a 2d array to store the length + 1 by the length + 1 of the two strings, and initialize the values to be 0
  # we do the + 1 because we want to ensure that we have a 0 value for when we are out of bounds
  dp = Array.new(text1.size + 1) { Array.new(text2.size + 1, 0)}
  (1..text1.size).each do |i|
    (1..text2.size).each do |j|
      # we're going to first compare the characters at index i - 1 and j - 1 aka the first characters 
      # such as 'abc' and 'ace' we're going to compare 'a' and 'a'
      # we want to compare the characters at the current index - 1 because we're using a 2D array
      # and we want to ensure that we're not out of bounds AND we want to be able to move down the graph diagonally
      # if the characters are equal, we can add 1 to the previous longest common subsequence
      # if the characters are not equal, we can take the maximum of the previous longest common subsequence
      if text1[i - 1] == text2[j - 1]
        # if they're equal then we can add 1 to the previous longest common subsequence and move to the next character
        dp[i][j] = dp[i - 1][j - 1] + 1
      else
        # if they're not equal then we can take the maximum of the previous longest common subsequence
        dp[i][j] = [dp[i - 1][j], dp[i][j - 1]].max
      end
    end
  end
  # the last value in the 2D array will be the length of the longest common subsequence
  dp[text1.size][text2.size]
end