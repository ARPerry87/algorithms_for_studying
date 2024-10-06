# Leetcode link: https://leetcode.com/problems/add-binary/
# Problem: Given two binary strings, return their sum (also a binary string).
# The input strings are both non-empty and contains only characters 1 or 0.
# Example:
# Input: a = "11", b = "1"
# Output: "100"

def add_binary(a, b)
  # one of the ways to turn strings into bitwise operators is to use the to_i method
  # the to_i method takes an argument which is the base of the number
  # in this case we're using base 2 as we want to convert the string to a binary number
  # we then add the two binary numbers together
  # we then convert the sum back to a string using the to_s method
  # we also pass in the base of the number which is 2
  # this will convert the sum back to a binary string
  ((a.to_i(2) + b.to_i(2)).to_s(2))
end