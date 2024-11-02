# Leetcode link: https://leetcode.com/problems/decode-string/
# Given an encoded string, return its decoded string.
# The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times.
# You may assume that the input string is always valid. No extra white spaces, square brackets are well-formed, etc.
 
# Example 1:
# Input: s = "3[a]2[bc]"
# Output: "aaabcbc"
 
# Example 2:
# Input: s = "3[a2[c]]"
# Output: "accaccacc"

# Plan:
# 1. We will use a stack to keep track of the current string and the number of times to repeat it.
# 2. We will iterate through each character in the string.
# 3. If we encounter a digit, we will build the number (in case of multiple digits).
# 4. If we encounter an opening bracket '[', we will push the current string and the number onto the stack and reset them.
# 5. If we encounter a closing bracket ']', we will pop from the stack and repeat the string the specified number of times.
# 6. If we encounter a letter, we will append it to the current string.
# 7. Finally, we will return the decoded string.
# 8. The time complexity is O(n) where n is the length of the input string.

def decode_string(s)
  stack = []
  curr_num = 0
  curr_str = ""

  s.each_char do |c|
    if c =~ /\d/ # If the character is a digit
      curr_num = curr_num * 10 + c.to_i # Build the number
    elsif c == '[' # If the character is an opening bracket
      stack.push([curr_str, curr_num]) # Push the current string and number onto the stack
      curr_str = "" # Reset current string
      curr_num = 0 # Reset current number
    elsif c == ']' # If the character is a closing bracket
      last_str, num = stack.pop # Pop from the stack
      curr_str = last_str + curr_str * num # Repeat the string
    else # If the character is a letter
      curr_str += c # Append the letter to the current string
    end
  end

  curr_str # Return the decoded string
end