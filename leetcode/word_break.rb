# Leetcode link: https://leetcode.com/problems/word-break/
# Description: Given a non-empty string s and a dictionary wordDict containing a list of non-empty words, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
# Note:
# The same word in the dictionary may be reused multiple times in the segmentation.
# You may assume the dictionary does not contain duplicate words.
# Example 1:
# Input: s = "leetcode", wordDict = ["leet", "code"]
# Output: true
# Explanation: Return true because "leetcode" can be segmented as "leet code".
# Example 2:
# Input: s = "applepenapple", wordDict = ["apple", "pen"]
# Output: true
# Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
# Note that you are allowed to reuse a dictionary word.
# Example 3:
# Input: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
# Output: false

# Solution:

def word_break(s, word_dict)
  dp = Array.new(s.size + 1, false) # we want to create an array of the same size as the input string and set all the values to false
  dp[0] = true # we want to set the first value to true because we want to ensure that we have a starting point
  
  (1..s.size).each do |i|
    (0...i).each do |j|
      # we want to check if the value at j is true and if the substring from j to i is included in the word dictionary
      # if it is, we can set the value at i to true
      # if it's not, we can move to the next value
      if dp[j] && word_dict.include?(s[j...i])
        dp[i] = true
        break
      end
    end
  end
  dp[s.size]
end