# Leetcode link: https://leetcode.com/problems/palindromic-substrings/
# Description: Given a string s, return the number of palindromic substrings in it. A string is a palindrome when it reads the same backward as forward.
 
# A substring is a contiguous sequence of characters within the string.

# Example 1:
# Input: s = "abc"
# Output: 3
# Explanation: Three palindromic strings: "a", "b", "c".

# Example 2:
# Input: s = "aaa"
# Output: 6
# Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".

# Constraints:
# 1 <= s.length <= 1000
# s consists of lowercase English letters.

# Plan:
# 1. Initialize a count variable to 0
# 2. Iterate through the string s
# 3. For each character in the string, call the expand method with the current index and the current index + 1
 
def count_substrings(s)
  count = 0 # initialize the count variable to 0
  s.length.times do |i| # iterate through the string s using the index i by the length of the string
    count += expand(s, i, i) # call the expand method with the current index and the current index
    count += expand(s, i, i + 1) # call the expand method with the current index and the current index + 1
  end
  count # return the count variable
end

def expand(s, left, right)
  count = 0 # initialize the count variable to 0
  while left >= 0 && right < s.length && s[left] == s[right] # while the left index is greater than or equal to 0, the right index is less than the length of the string, and the characters at the left and right indices are the same
    count += 1 # increment the count variable
    left -= 1 # decrement the left index
    right += 1 # increment the right index
  end
  count # return the count variable
end