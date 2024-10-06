# Leetcode link: https://leetcode.com/problems/integer-to-roman/
# Problem: Given an integer, convert it to a roman numeral.
# Example:
# Input: num = 3
# Output: "III"

# Solution:

def int_to_roman(num)
  # we create a hash map to store the roman numerals
  # we then create a variable to store the roman numeral
  # we then iterate through the hash map
  # we then check if the number is greater than or equal to the value of the roman numeral
  # if it is we add the roman numeral to the result
  # we then subtract the value of the roman numeral from the number
  # we then return the result
  # the time complexity of this solution is O(n)
  roman_numerals = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  result = ""
  roman_numerals.each do |roman, value|
    while num >= value
      result += roman
      num -= value
    end
  end
  result
end

# faster solution

def int_to_roman(num)
  alphas = %w[I IV V IX X XL L XC C CD D CM M]
  alpha_values = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
  ans = ""
  alphas.zip(alpha_values).reverse.each_with_index do |alpha_value, index|
    while num >= alpha_value[1]
      ans << alpha_value[0]
      num -= alpha_value[1]
    end
  end
  ans
end