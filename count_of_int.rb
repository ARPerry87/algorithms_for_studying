# Leetcode https://leetcode.com/problems/count-of-integers/
# You are given two numeric strings num1 and num2 and two integers max_sum and min_sum. We denote an integer x to be good if:
# num1 <= x <= num2
# min_sum <= digit_sum(x) <= max_sum.
# Return the number of good integers. Since the answer may be large, return it modulo 109 + 7.

# Note that digit_sum(x) denotes the sum of the digits of x.
# Return the number of good integers. Since the answer may be large, return it modulo 109 + 7.

# Note that digit_sum(x) denotes the sum of the digits of x.

# Example 1: 
# Input: num1 = "1", num2 = "12", min_sum = 1, max_sum = 8
# Output: 11
# Explanation: There are 11 integers whose sum of digits lies between 1 and 8 are 1,2,3,4,5,6,7,8,10,11, and 12. Thus, we return 11.

# Plan: 
# 1. Initialize a variable count to 0
# 2. Iterate from num1 to num2 by turning num1 and num2 into integers from strings
# 3. For each number, calculate the sum of its digits
# 4. If the sum is between min_sum and max_sum, increment count
# 5. Return count
# Time complexity: O(n) where n is the difference between num1 and num2
# Space complexity: O(1)

MOD = 10**9 + 7
def count(num1, num2, min_sum, max_sum)
  count = 0 
  num1 = num1.to_i
  num2 = num2.to_i
  (num1..num2).each do |num|
    sum = num.digits.sum
    count += 1 if sum >= min_sum && sum <= max_sum
  end
  count % MOD
end