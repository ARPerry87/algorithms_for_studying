# Leetcode link: https://leetcode.com/problems/maximum-product-subarray/
# Problem: Given an integer array nums, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

# Solution:

def max_product(nums)
  res = nums.max
  current_min, current_max = 1, 1

  nums.each do |n|
    if n == 0
      current_min, current_max = 1, 1
      next
    end
    temp = current_max * n
    current_max = [current_max * n, current_min * n, n].max
    current_min = [temp, n * current_min, n].min
    res = [res, current_max].max
  end
  return res
end

# optimized

def max_product(nums)
  res = nums[0]
  current_min, current_max = nums[0], nums[0]

  nums[1..-1].each do |n|
    if n < 0
      current_min, current_max = current_max, current_min
    end
    current_max = [n, current_max * n].max
    current_min = [n, current_min * n].min
    res = [res, current_max].max
  end
  res
end