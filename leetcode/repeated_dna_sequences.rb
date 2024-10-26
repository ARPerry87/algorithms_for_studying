# Leetcode https://leetcode.com/problems/repeated-dna-sequences/
# All DNA is composed of a series of nucleotides abbreviated as 'A', 'C', 'G', and 'T', for example: "ACGAATTCCG". When studying DNA, it is useful to identify repeated sequences within the DNA.
# 
# Given a string s that represents a piece of DNA, return all the 10-letter-long sequences (substrings) that occur more than once in a DNA molecule. You may return the answer in any order.
# 
# Example 1:
# 
# Input: s = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
# Output: ["AAAAACCCCC","CCCCCAAAAA"]
# Example 2:
# 
# Input: s = "AAAAAAAAAAAAA"
# Output: ["AAAAAAAAAA"]
# 
# Constraints:
# 1 <= s.length <= 105
# s[i] is either 'A', 'C', 'G', or 'T'.

# Plan:
# 1. Initialize a hash to store the count of each 10-letter-long sequence
# 2. Initialize a hash to store the result
# 3. Iterate through the string s
# 4. For each 10-letter-long sequence, increment the count in the hash
# 5. If the count is greater than 1, add the sequence to the result hash
# 6. Return the keys of the result hash
# Time complexity: O(n) where n is the length of the string s
# Space complexity: O(n) where n is the length of the string s
 
# @param {String} s
# @return {String[]}

def find_repeated_dna_sequences(s)
  count = Hash.new(0) # initialize a hash to store the count of each 10-letter-long sequence
  result = Hash.new # initialize a hash to store the result

  (0..s.length - 10).each do |i| # iterate through the string s
    sequence = s[i, 10] # get the 10-letter-long sequence
    count[sequence] += 1 # increment the count of the sequence
    result[sequence] = true if count[sequence] > 1 # if the count is greater than 1, add the sequence to the result hash
  end

  result.keys # return the keys of the result hash
end
