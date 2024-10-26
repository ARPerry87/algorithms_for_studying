# Leetcode link: https://leetcode.com/problems/number-of-valid-words-in-a-sentence/
# Description: A sentence consists of lowercase letters ('a' to 'z'), digits ('0' to '9'), hyphens ('-'), punctuation marks ('!', '.', and ','), and spaces (' ') only. Each sentence can be broken down into one or more tokens separated by one or more spaces ' '.

# A token is a valid word if all three of the following are true:

# It only contains lowercase letters, hyphens, and/or punctuation (no digits).
# There is at most one hyphen '-'. If present, it must be surrounded by lowercase characters ("a-b" is valid, but "-ab" and "ab-" are not valid).
# There is at most one punctuation mark. If present, it must be at the end of the token ("ab,", "cd!", and "." are valid, but "a!b" and "c.," are not valid).
# Examples of valid words include "a-b.", "afad", "ba-c", "a!", and "!".

# Given a string sentence, return the number of valid words in sentence.
 
# Example 1:
# Input: sentence = "cat and dog"
# Output: 3
# Explanation: The valid words in the sentence are "cat", "and", and "dog".

# Example 2:
# Input: sentence = "!this 1-s b8d!"
# Output: 0
# Explanation: There are no valid words in the sentence.
# Constraints:
# 1 <= sentence.length <= 1000
# sentence consists of lowercase letters, digits ('0' to '9'), hyphens ('-'), punctuation marks ('!', '.', and ','), and spaces (' ') only.
# sentence contains at least one token.

# Plan:
# 1. Split the sentence into words using the split method
# 2. Initialize a count variable to 0
# 3. Iterate through the words array
# 4. For each word, check if it is a valid word using the valid_word? method
# 5. If it is a valid word, increment the count variable
# 6. Return the count variable
# Time complexity: O(n) where n is the length of the sentence
# Space complexity: O(n) where n is the length of the sentence

def count_valid_words(sentence)
  result = 0 # initialize the result count to 0
  sentence.split(" ").each do |word| # split the sentence into words on the space and iterate through the array
      result += 1 if valid?(word) # increment the result count if the word is valid
  end
  result # return the result count
end

def valid?(word)
  word.match?(/^(([a-z]+(-)?)?[a-z]+)?[.!,]?$/) # check if the word is valid using a regex pattern, which checks if it has any a-z characters, followed by an optional hyphen, and then more a-z characters, followed by an optional punctuation mark at the end
end