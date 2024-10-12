# Leetcode link: https://leetcode.com/problems/missing-number/
# Problem: Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

# Solution

def missing_number(nums)
  n = nums.length
  (n * (n + 1) / 2) - nums.sum
end

# or using XOR

def missing_number(nums)
  n = nums.length
  res = 0
  (0..n).each do |i|
    res ^= i
  end
  nums.each do |num|
    res ^= num
  end
  res
end

# or using nums.size intead of length to
# save some runtime

def missing_number(nums)
  size = nums.size
  size * (size + 1) / 2 - nums.sum
end