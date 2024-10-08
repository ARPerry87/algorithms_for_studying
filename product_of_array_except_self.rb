# Leetcode link: https://leetcode.com/problems/product-of-array-except-self/
# 
# Problem: Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].
# The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
# You must write an algorithm that runs in O(n) time and without using the division operation.

# Solution:

def product_except_self(nums)
  res = [1] * nums.length
  prefix = 1

  nums.each_with_index do |num, i|
    res[i] = prefix
    prefix *= num
  end

  post_fix = 1
  (nums.length - 1).downto(0) do |i|
    res[i] *= post_fix
    post_fix *= nums[i]
  end

  return res
end

# optimized

def product_except_self(nums)
  length = nums.length
  res = Array.new(length, 1)

  left_product = 1
  (0...length).each do |i|
    res[i] = left_product
    left_product *= nums[i]
  end

  right_product = 1
  (length - 1).downto(0) do |i|
    res[i] *= right_product
    right_product *= nums[i]
  end

  res
end

# another solution

def product_except_self(nums)
  length = nums.length
  left = Array.new(length, 1)
  right = Array.new(length, 1)
  res = Array.new(length, 1)

  (1...length).each do |i|
    left[i] = left[i - 1] * nums[i - 1]
  end

  (length - 2).downto(0) do |i|
    right[i] = right[i + 1] * nums[i + 1]
  end

  (0...length).each do |i|
    res[i] = left[i] * right[i]
  end

  res
end