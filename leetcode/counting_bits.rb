# Leetcode link: https://leetcode.com/problems/counting-bits/
# Problem: Given an integer n, return an array ans of length n + 1 such that for each i (0 <= i <= n), ans[i] is the number of 1's in the binary representation of i.

# # Solution

def count_bits(n)
  res = [0]
  (1..n).each do |i|
    res[i] = res[i >> 1] + (i & 1)
  end
  res
end