# Leetcode link: https://leetcode.com/problems/delete-characters-to-make-fancy-string/
# Problem: A fancy string is a string where no three consecutive characters are equal.
# Given a string s, delete the minimum possible number of characters from s to make it fancy.
# Return the final string after the deletion. It can be shown that the answer will always be unique.
 
# Example 1:
# Input: s = "leeetcode"
# Output: "leetcode"
# Explanation: Remove an 'e' from the first group of 'e's to create "leetcode".
# No three consecutive characters are equal, so return "leetcode".

# Example 2:
# Input: s = "aaabaaaa"
# Output: "aabaa"
# Explanation: Delete all the 'a's at the beginning of the string.

# Plan:
# 1. Initialize a variable count to 0 and an empty string result
# 2. Iterate through the string s
# 3. If the current character is equal to the previous character and the count is 2, skip the character
# 4. Otherwise, add the character to the result and update the count
# 5. Return the result
# Time complexity: O(n) where n is the length of the string s
# Space complexity: O(n) where n is the length of the string s

# @param {String} s
# @return {String}
def make_fancy_string(s)
  count = 0 
  result = ''

  s.each_char do |char|
    if result[-1] == char && count == 2
      next 
    elsif result[-1] == char
      count += 1
      result << char
    else
      count = 1
      result << char
    end
  end

  result
end
