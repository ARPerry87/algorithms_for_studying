# Leetcode link: https://leetcode.com/problems/zigzag-conversion/
# Problem: The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this:
# P   A   H   N
# A P L S I I G
# Y   I   R
# And then read line by line: "PAHNAPLSIIGYIR"
# Write the code that will take a string and make this conversion given a number of rows.
# Example:
# Input: s = "PAYPALISHIRING", numRows = 3
# Output: "PAHNAPLSIIGYIR"

# Solution:

def convert(s, num_rows)
  return s if num_rows == 1 || s.length <= num_rows

  rows = Array.new(num_rows, "")
  row = 0
  down = false

  s.each_char do |char|
    rows[row] += char
    if row == 0 || row == num_rows - 1
      down = !down
    end
    row += down ? 1 : -1
  end
  rows.join
end

# Let's try to refactor (this is slower on all accounts)

def convert(s, num_rows)
  return s if num_rows == 1 || s.length <= num_rows

  rows = Array.new(num_rows) { [] }
  index = 0
  step = -1

  s.chars.each do |c|
    rows[index] << c
    if index == 0 || index == num_rows - 1
      step = -step
    end
    index += step
  end
  for i in 1..num_rows - 1
    rows[0] += rows[i]
  end
  rows[0].join
end