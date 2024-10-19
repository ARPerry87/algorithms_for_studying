# Leetcode link: https://leetcode.com/problems/maximum-swap/
# Description: You are given an integer num. You can swap two digits at most once to get the maximum valued number.
# Return the maximum valued number you can get.

# Example 1:
# Input: num = 2736
# Output: 7236
# Explanation: Swap the number 2 and the number 7.

# Example 2:
# Input: num = 9973
# Output: 9973
# Explanation: No swap.

# Solution:

def maximum_swap(num)
  num_str = num.to_s.chars
  last = Array.new(10, -1)
  
  num_str.each_with_index do |digit, i|
    last[digit.to_i] = i
  end

  num_str.each_with_index do |digit, i|
    (9).downto(digit.to_i + 1) do |d|
      if last[d] > i
        num_str[i], num_str[last[d]] = num_str[last[d]], num_str[i]
        return num_str.join.to_i
      end
    end
  end

  num
end