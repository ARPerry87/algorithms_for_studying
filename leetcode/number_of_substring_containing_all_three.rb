# Leetcode link: https://leetcode.com/problems/number-of-substrings-containing-all-three-characters/
# Description: Given a string s consisting only of characters a, b and c.
# Return the number of substrings containing at least one occurrence of all these characters a, b and c.
# Example 1:
# Input: s = "abcabc"
# Output: 10
# Explanation: The substrings containing at least one occurrence of the characters a, b and c are "abc", "abca", "abcab", "abcabc", "bca", "bcab", "bcabc", "cab", "cabc" and "abc" (again).
# Example 2:
# Input: s = "aaacb"
# Output: 3
# Explanation: The substrings containing at least one occurrence of the characters a, b and c are "aaacb", "aacb" and "acb".j

# Solution:

def number_of_substrings(s)
  # we want to initialize the count, a_count, b_count, c_count, and left
  # we want to iterate through the string and increment the count, a_count, b_count, and c_count
  # we have a left and right pointer
  count = 0
  a_count = b_count = c_count = 0
  left = 0

  s.each_char.with_index do |char, right|
    # we want to increment the count, a_count, b_count, and c_count based on the character
    case char
    when 'a'
      a_count += 1
    when 'b'
      b_count += 1
    when 'c'
      c_count += 1
    end

    # we want to increment the left pointer and decrement the count, a_count, b_count, and c_count
    while a_count > 0 && b_count > 0 && c_count > 0
      count += s.length - right
      case s[left]
      when 'a'
        a_count -= 1
      when 'b'
        b_count -= 1
      when 'c'
        c_count -= 1
      end
      left += 1
    end
  end
  count
end

