# Leetcode link: https://leetcode.com/problems/number-of-1-bits/
# Problem: Write a function that takes an unsigned integer and returns the number of '1' bits it has (also known as the Hamming weight).

# Solution

def hamming_weight(n)
  count = 0
  while n > 0
    count += 1 if n & 1 == 1
    n >>= 1
  end
  count
end