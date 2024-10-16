# Leetcode link: https://leetcode.com/problems/optimal-partition-of-string/
 
# Description:
# Given a string s, partition the string into one or more substrings such that the characters
# in each substring are unique. That is no two characters should be the same in each substring more than once.
# Return the minimum number of partitions needed to partition the string.
# Note that each character should belong to exactly one substring in a partition.
# 
# Example 1:
# Input: s = "abacaba"
# output: 4
# The two possible partitions are ("a", "ba", "cab", "a") and ("ab", "a", "ca", "ba")

# Example 2:
# Input: s = "ssssss"
# Output: 6
# The only possible partitions are ("s", "s", "s", "s", "s", "s")

# Constraints:
# 1 <= s.length <= 10^5
# s consists of lowercase English letters.

# Solution:

# we want to initialize the hash and the result
# we want to iterate through the string and increment the count of the character in the hash
# we want to increment the result if the count of the character is 1
# we want to return the result at the end

def min_partitions(s)
  seen = {} # initialize the hash to keep track of seen characters
  result = 1 # initialize the result with 1 since we need at least one partition

  s.each_char do |c| # iterate through the string
    if seen[c] # if the character has been seen before
      result += 1 # increment the result to start a new partition
      seen.clear # clear the seen hash for the new partition
    end
    seen[c] = true # mark the character as seen
  end

  result # return the result which is the count of the number of partitions
end

# or with a set

def min_partitions(s)
  seen = Set.new # initialize the set to keep track of seen characters
  result = 1 # initialize the result with 1 since we need at least one partition

  s.each_char do |c| # iterate through the string
    if seen.include?(c) # if the character has been seen before
      result += 1 # increment the result to start a new partition
      seen.clear # clear the seen set for the new partition
    end
    seen.add(c) # mark the character as seen
  end
  result # return the result which is the count of the number of partitions
end