# Leetcode https://leetcode.com/problems/check-if-binary-string-has-at-most-one-segment-of-ones/
# Given a binary string s without leading zeros, return true if s contains at most one contiguous segment of ones. Otherwise, return false. 
 
# Example 1:
# Input: s = "1001"
# Output: false
# Explanation: The ones do not form a contiguous segment.
 
# Example 2:
# Input: s = "110"
# Output: true
# Explanation: The ones form at most one contiguous segment.

# Constraints
# 1 <= s.length <= 100
# s[i] is either '0' or '1'.
# s[0] is '1'.


def check_ones_segment(s)
  return false if s.length == 1 && s[0] == "0"
  return !s.include?("01")
end

# and now using an actual algo

def check_ones_segment(s)
  return false if s.length == 1 && s[0] == "0"

  count = 0
  s.each_char.with_index do |c, i|
    if c == "1" && (i == 0 || s[i - 1] == "0") # if the current character is 1 and the previous one is 0 or the current index is 0
      count += 1 # if the current character is a 1 and starting a continuous segment or if the previous number is 0 and is followed by a 1 (thus showing a new continuous segment), increment the count by 1
    end
  end
  return count <= 1 # return true or false depending on the count of continuous segments, if greater than 1 it returns false, if 1 then returns true
end