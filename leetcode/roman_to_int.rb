# Leetcode link: https://leetcode.com/problems/roman-to-integer/
# Problem: Given a roman numeral, convert it to an integer.
# Example:
# Input: s = "III"
# Output: 3

# Solution:
def roman_to_int(s)
  # we need to create a hash map to store the roman numerals
  # we then create a variable to store the sum of the roman numerals
  # we then iterate through the string
  # we then check if the current roman numeral is less than the next roman numeral
  # if it is we subtract the current roman numeral from the sum
  # if it isn't we add the current roman numeral to the sum
  # we then return the sum
  # we also need to add the last roman numeral to the sum
  # this is because the last roman numeral will not be checked in the loop
  # we then return the sum
  # the time complexity of this solution is O(n)
  
  roman_numerals = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  sum = 0
  for a, b in s.chars.each_cons(2)
    if roman_numerals[a] < roman_numerals[b]
      sum -= roman_numerals[a]
    else
      sum += roman_numerals[a]
    end
  end
  return sum + roman_numerals[s[-1]]
end