# Leetcode link: https://leetcode.com/problems/longest-substring-with-at-least-k-repeating-characters/
# Description: Given a string s and an integer k, return the length of the longest substring of s that contains at least k repeating characters.

# Example 1:
# Input: s = "aaabb", k = 3
# Output: 3
# Explanation: The longest substring is "aaa", with length 3.
# 
# Example 2:
# Input: s = "ababbc", k = 2
# Output: 5
# Explanation: The longest substring is "ababb", since it contains 2 'a's and 2 'b's.

# Constraints:
# 1 <= s.length <= 50
# 1 <= k <= 50
 
# Plan: 
# Use sliding window
# 1. Create a hash to count the frequency of each character in the current window.
# 2. Use a max_length variable to keep track of the maximum length of the substring found so far.
# 3. Use two pointers to represent the current window.
# 4. Expand the right pointer to include more characters in the window.
# 5. If the number of characters that have a frequency less than k is greater than 0, move the left pointer to shrink the window until the condition is satisfied.
# 6. Update the max_length variable whenever a valid window is found.

def longest_substring_with_at_least_k_repeating(s, k)
  return 0 if s.nil? || s.empty? || k > s.length

  max_length = 0

  (1..26).each do |unique_chars|
    left = 0
    right = 0
    char_count = Hash.new(0)
    count_at_least_k = 0

    while right < s.length
      char_count[s[right]] += 1
      count_at_least_k += 1 if char_count[s[right]] == k

      while char_count.keys.length > unique_chars
        char_count[s[left]] -= 1
        count_at_least_k -= 1 if char_count[s[left]] == k - 1
        left += 1
      end

      max_length = [max_length, right - left + 1].max if count_at_least_k > 0
      right += 1
    end
  end

  max_length
end

# Test cases
puts longest_substring_with_at_least_k_repeating("aaabb", 3) # Output: 3
puts longest_substring_with_at_least_k_repeating("ababbc", 2) # Output: 5
puts longest_substring_with_at_least_k_repeating("a", 1) # Output: 1
puts longest_substring_with_at_least_k_repeating("abc", 2) # Output: 0
puts longest_substring_with_at_least_k_repeating("aaabbb", 3) # Output: 6
puts longest_substring_with_at_least_k_repeating("aabbcc", 2) # Output: 6
puts longest_substring_with_at_least_k_repeating("aaabbbccc", 3) # Output: 9
puts longest_substring_with_at_least_k_repeating("abcde", 1) # Output: 5
puts longest_substring_with_at_least_k_repeating("aabbccddeeff", 2) # Output: 12