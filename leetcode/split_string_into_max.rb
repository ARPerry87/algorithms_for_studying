# Leetcode https://leetcode.com/problems/split-a-string-into-the-max-number-of-unique-substrings/
# Given a string s, return the maximum number of unique substrings that the given string can be split into.

# You can split string s into any list of non-empty substrings, where the concatenation of the substrings forms the original string. However, you must split the substrings such that all of them are unique.

# A substring is a contiguous sequence of characters within a string.

# Example 1:
# Input: s = "ababccc"
# Output: 5
# Explanation: One way to split maximally is ['a', 'b', 'ab', 'c', 'cc'].
# Splitting like ['a', 'b', 'a', 'b', 'c', 'cc'] is not valid as you have 'a' and 'b' multiple times.
# Example 2:
# Input: s = "aba"
# Output: 2
# Explanation: One way to split maximally is ['a', 'ba'].

# Constraints:
# 1 <= s.length <= 16
# s contains only lower case English letters.

def max_unique_substrings(s)
  @max = 0 # initialize the maximum to 0
  dfs(s, 0, Set.new) # call the dfs method with the string, starting index of 0, and an empty set
  @max # return the maximum
end

def dfs(s, idx, set)
  return if idx == s.length # if the index is equal to the length of the string, return as it's the only index
  (idx...s.length).each do |i| # iterate through the string from the current index to the length of the string
    substring = s[idx..i] # get the substring from the current index to the current iteration index
    if !set.include?(substring) # if the set does not include the substring
      set.add(substring) # add the substring to the set
      @max = [set.size, @max].max # set the maximum to the maximum of the set size and the current maximum
      dfs(s, i + 1, set) # recursively call the dfs method with the string, the current index + 1, and the set
      set.delete(substring) # delete the substring from the set
    end
  end
end