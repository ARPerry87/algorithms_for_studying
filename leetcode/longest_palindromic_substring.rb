# Leetcode https://leetcode.com/problems/longest-palindromic-substring/
# Given a string s, return the longest palindromic substring in s.

# Plan:
# 1. We will use a helper function to expand around the center of the palindrome.
# 2. We will iterate through each character in the string and consider it as the center of a palindrome.
# 3. For each character, we will check for both odd-length and even-length palindromes.
# 4. We will keep track of the longest palindrome found so far.
# 5. The time complexity is O(n^2) and the space complexity is O(1).
# 6. Let's implement the solution.

def longest_palindrome(s)
  return s if s.length < 2

  start, finish = 0, 0 # To keep track of the start and end indices of the longest palindrome

  (0...s.length).each do |i|
    len1 = expand_around_center(s, i, i) # Odd length palindrome, we want to start with the string at i and expand outwards
    len2 = expand_around_center(s, i, i + 1) # Even length palindrome, we want to start with the string at i and i + 1 and expand outwards
    max_len = [len1, len2].max # Get the maximum length of the two palindromes

    if max_len > finish - start # If the maximum length is greater than the current longest palindrome
      start = i - (max_len - 1) / 2 # Update the start index
      finish = i + max_len / 2 # Update the end index
    end
  end
  s[start..finish].to_s # Return the longest palindromic substring
end

def expand_around_center(s, left, right)
  while left >= 0 && right < s.length && s[left] == s[right] # Check if the characters at the left and right indices are equal
    left -= 1
    right += 1
  end
  right - left - 1
end

def longest_palindrome_2(s)
  return s if s.length < 2

  start = 0
  max_length = 1

  dp = Array.new(s.length) { Array.new(s.length, false) } # Create a 2D array to store the results, dp[i][j] will be true if the substring from i to j is a palindrome

  (0...s.length).each do |i| # All substrings of length 1 are palindromes
    dp[i][i] = true
  end

  (s.length - 1).downto(0) do |i| # Check for palindromes of length 2 or more
    (i + 1...s.length).each do |j| # Check for palindromes of length 2 or more
      if s[i] == s[j] # If the characters at i and j are equal
        if j - i == 1 || dp[i + 1][j - 1] # If the substring from i + 1 to j - 1 is a palindrome
          dp[i][j] = true # Mark the substring from i to j as a palindrome
          if j - i + 1 > max_length # If the length of the current palindrome is greater than the maximum length
            start = i # Update the start index
            max_length = j - i + 1 # Update the maximum length
          end
        end
      end
    end
  end

  s[start, max_length] # Return the longest palindromic substring
end