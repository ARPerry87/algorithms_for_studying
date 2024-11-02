# Leetcode link: https://leetcode.com/problems/circular-sentences/
# A sentence is a list of words that are separated by a single space with no leading or trailing spaces. Each of the words consists of only uppercase and lowercase English letters (no punctuation).
 
# For example, "Hello World", "HELLO", and "hello world hello world" are all sentences.
 
# A sentence is circular if the last character of a word is equal to the first character of the next word. 
# The last character of the last word is equal to the first character of the first word.

# For example, "leetcode exercises sound delightful", "eetcode", "leetcode eats soul" are all circular sentences. However, "Leetcode is cool", "happy Leetcode", "Leetcode" and "I like Leetcode" are not circular sentences.

# Given a string sentence, return true if it is circular, else return false.

def is_circular_sentence(s)
  words = s.split # Split the sentence into words

  return false if words.empty? # If there are no words, return false

  words.each_with_index do |word, i| # Iterate through each word, keeping the word and the index 
    next_word = words[(i + 1) % words.length] # the expression (i + 1) % words.length will ensure that the index wraps around to the beginning of the array if it reaches the end
    return false if word[-1] != next_word[0] # If the last character of the current word is not equal to the first character of the next word, return false

    return true if i == words.length - 1 # Check if the current word is the last word in the array, if it is, and all previous checks passed, return true
  end

  false # If the sentence is not circular, return false
end