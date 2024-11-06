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


def count(num1, num2, min_sum, max_sum) 

  mod = 10**9 + 7 # modulo value for when we get very large numbers in the input for the sum

  def dp(index, curr, check, num, min_sum, max_sum, visited) # helper function to calculate the number of good integers
    if index == num.length # if the index is equal to the length of the number
      return (min_sum <= curr && curr <= max_sum) ? 1 : 0 # if the sum of the digits of the number is between the min_sum and max_sum, return 1, else return 0
    end
    if visited.key?([index, curr, check]) # if the visited hash has the key [index, curr, check]
      return visited[[index, curr, check]] # return the value of the key
    end
    temp = num[index].to_i # set temp to the integer value of the number at the current index
    temp = 9 if check # if check is true, set temp to 9

    res = 0 # initialize res to 0
    (0..temp).each do |i| # iterate from 0 to temp
      res += dp(index + 1, curr + i, check || i < temp, num, min_sum, max_sum, visited) # increment res by the result of the recursive call to dp with the index incremented by 1, the current sum incremented by i, check or i < temp, the number, min_sum, max_sum, and visited hash
    end

    visited[[index, curr, check]] = res # set the value of the visited hash at the key [index, curr, check] to res
    res
  end

  visited = {} # initialize a visited hash
  res = dp(0, 0, false, num2, min_sum, max_sum, visited) # set res to the result of the recursive call to dp with the index 0, current sum 0, check false, number num2, min_sum, max_sum, and visited hash
  visited = {} # reset the visited hash
  res -= dp(0, 0, false, num1, min_sum, max_sum, visited) # subtract the result of the recursive call to dp with the index 0, current sum 0, check false, number num1, min_sum, max_sum, and visited hash from res

  if num1.chars.map(&:to_i).sum.between?(min_sum, max_sum) # if the sum of the digits of num1 is between min_sum and max_sum
    res += 1 # increment res by 1
  end

  res % mod # return res modulo mod
end