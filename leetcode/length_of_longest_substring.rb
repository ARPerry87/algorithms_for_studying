# Leetcode link: https://leetcode.com/problems/longest-substring-without-repeating-characters/
# Problem: Given a string s, find the length of the longest substring without repeating characters.


# Solution

def length_of_longest_substring(s)
  # we want to set our current result to 0
  # then we want to set our starting index to 0
  # then we want to store the resulting characters and their indexes in a hash
  res = 0
  start = 0
  hash = {}

  # we want to iterate through the string and also grab it's index

  s.each_char.with_index do |c, i|
    # if the character is in the hash 
    # and the index of the character is greater than
    # or equal to the starting index
    # we want to set the starting index to the index of the character + 1
    # This is because we want to start counting from the next character
    # As this would mean that there is a repeating character
    if hash[c] && hash[c] >= start
      start = hash[c] + 1
    end
    # we want to store the character and it's index in the hash
    # we also want to store the maximum value 
    # of the current result and the difference 
    # between the index and the starting index
    # as we want the maximum length of the substring
    hash[c] = i
    res = [res, i - start + 1].max
  end
  res
end