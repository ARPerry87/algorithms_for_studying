# Leetcode https://leetcode.com/problems/sum-of-k-mirror-numbers/
# A k-mirror number is a positive integer without leading zeros that reads the same both forward and backward in base-10 as well as in base-k.

# For example, 9 is a 2-mirror number. The representation of 9 in base-10 and base-2 are 9 and 1001 respectively, which read the same both forward and backward.
# On the contrary, 4 is not a 2-mirror number. The representation of 4 in base-2 is 100, which does not read the same both forward and backward.
# Given the base k and the number n, return the sum of the n smallest k-mirror numbers.
# 
# Input: k = 2, n = 5
# Output: 25
# Explanation:
# The 5 smallest 2-mirror numbers and their representations in base-2 are listed as follows:
#   base-10    base-2
#     1          1
#     3          11
#     5          101
#     7          111
#     9          1001
# Their sum = 1 + 3 + 5 + 7 + 9 = 25. 
# 
#Example 2:

# Input: k = 3, n = 7
# Output: 499
# Explanation:
# The 7 smallest 3-mirror numbers are and their representations in base-3 are listed as follows:
#   base-10    base-3
#     1          1
#     2          2
#     4          11
#     8          22
#     121        11111
#     151        12121
#     212        21212
# Their sum = 1 + 2 + 4 + 8 + 121 + 151 + 212 = 499.
# 
# Constraints:
# 2 <= k <= 9
# 1 <= n <= 30

# Plan:
# Make a helper method to check if a number is a k-mirror number
# Iterate through the numbers from 1 to infinity
# Check if the number is a k-mirror number
# If it is, add it to the result array
# If the result array has n elements, return the sum of the elements
# Time complexity: O(n * log(n)) where n is the number of k-mirror numbers
# Space complexity: O(n) where n is the number of k-mirror numbers

def k_mirror(k, n)
  def is_palindrome?(s)
    s == s.reverse
  end

  def generate_palindromes(length)
    return (1..9).to_a if length == 1
    half_length = (length + 1) / 2
    (10**(half_length - 1)...10**half_length).map do |half|
      half_str = half.to_s
      half_str + half_str[0, length / 2].reverse
    end
  end

  result = []
  length = 1
  while result.length < n
    generate_palindromes(length).each do |num|
      num = num.to_i
      if is_palindrome?(num.to_s(k))
        result << num
        return result.sum if result.length == n
      end
    end
    length += 1
  end
end