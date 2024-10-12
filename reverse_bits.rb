# Leetcode link: https://leetcode.com/problems/reverse-bits/
# Problem: Reverse bits of a given 32 bits unsigned integer.

# Solution

def reverse_bits(n)
  n.to_s(2).rjust(32, '0').reverse.to_i(2)
end

# or

def reverse_bits(n)
  res = 0
  (0...32).each do |i|
    res = (res << 1) | (n & 1)
    n >>= 1
  end
  res
end