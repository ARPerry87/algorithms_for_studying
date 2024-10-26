# Starting interview material specifically for amazon 
# Leetcode link: https://leetcode.com/problems/kids-with-greatest-number-of-candies/
# Description: Given the array candies and the integer extraCandies, where candies[i] represents the number of candies that the ith kid has.
# For each kid check if there is a way to distribute extraCandies among the kids such that he or she can have the greatest number of candies among them. Notice that multiple kids can have the greatest number of candies.
# Example 1:
# Input: candies = [2,3,5,1,3], extraCandies = 3
# Output: [true,true,true,false,true]
# Explanation: Kid 1 has 2 candies and if he or she receives all extra candies (3) will have 5 candies --- the greatest number of candies among the kids.
# Kid 2 has 3 candies and if he or she receives at least 2 extra candies will have the greatest number of candies among the kids.
# Kid 3 has 5 candies and this is already the greatest number of candies among the kids.
# Kid 4 has 1 candy and even if he or she receives all extra candies will only have 4 candies.
# Kid 5 has 3 candies and if he or she receives at least 2 extra candies will have the greatest number of candies among the kids.
# Example 2:
# Input: candies = [4,2,1,1,2], extraCandies = 1
# Output: [true,false,false,false,false]
# Explanation: There is only 1 extra candy, therefore only kid
# 1 will have the greatest number of candies among the kids regardless of who takes the extra candy.

# Solution:

def kids_with_candies(candies, extra_candies)
  # we want to find the maximum number of candies
  # we want to iterate through the array and check if the current number of candies plus the extra candies is greater than or equal to the maximum number of candies
  # if it is, we can return true
  # if it's not, we can return false
  max = candies.max
  candies.map { |candy| candy + extra_candies >= max }
end

# or with a faster runtime

def kids_with_candies(candies, extra_candies)
  res = []
  candies.each do |c|
    if (c + extra_candies >= candies.max)
      res << true
    else 
      res << false
    end
  end
  res
end