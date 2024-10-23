#Leetcode https://leetcode.com/problems/number-of-equal-count-substrings/
# Description: 
# You are given a 0-indexed string s consisting of only lowercase English letters, 
# and an integer count. A substring of s is said to be an equal count substring if, 
# for each unique letter in the substring, it appears exactly count times in the substring.

# Return the number of equal count substrings in s.

# A substring is a contiguous non-empty sequence of characters within a string.

# Example 1:

# Input: s = "aaabcbbcc", count = 3
# Output: 3
# Explanation:
# The substring that starts at index 0 and ends at index 2 is "aaa".
# The letter 'a' in the substring appears exactly 3 times.
# The substring that starts at index 3 and ends at index 8 is "bcbbcc".
# The letters 'b' and 'c' in the substring appear exactly 3 times.
# The substring that starts at index 0 and ends at index 8 is "aaabcbbcc".
# The letters 'a', 'b', and 'c' in the substring appear exactly 3 times.

def count_substrings(s, count)
  result = 0
  n = s.length
  (0...n).each do |start|
    char_count = Hash.new(0)
    (start...n).each do |end_idx|
      char_count[s[end_idx]] += 1
      if char_count.values.all? { |v| v == count }
        result += 1
      elsif char_count.values.any? { |v| v > count }
        break
      end
    end
  end
  result
end
