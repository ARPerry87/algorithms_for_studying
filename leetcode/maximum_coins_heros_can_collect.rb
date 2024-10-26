# Leetcode link: https://leetcode.com/problems/maximum-coins-heroes-can-collect/
# There is a battle and n heroes are trying to defeat m monsters. You are given two 1-indexed arrays of positive integers heroes and monsters of length n and m, respectively. heroes[i] is the power of ith hero, and monsters[i] is the power of ith monster.

# The ith hero can defeat the jth monster if monsters[j] <= heroes[i].

# You are also given a 1-indexed array coins of length m consisting of positive integers. coins[i] is the number of coins that each hero earns after defeating the ith monster.

# Return an array ans of length n where ans[i] is the maximum number of coins that the ith hero can collect from this battle.

# Note: The health of a hero doesn't get reduced after defeating a monster.
# Multiple heroes can defeat a monster, but each monster can be defeated by a given hero once.
# 
# Example 1:
# Input: heroes = [1,4,2], monsters = [1,1,5,2,3], coins = [2,3,4,5,6]
# Output: [5,16,10]
# Explanation: For each hero, we list the index of all the monsters he can defeat:
# 1st hero: [1,2] since the power of this hero is 1 and monsters[1], monsters[2] <= 1. So this hero collects coins[1] + coins[2] = 5 coins.
# 2nd hero: [1,2,4,5] since the power of this hero is 4 and monsters[1], monsters[2], monsters[4], monsters[5] <= 4. So this hero collects coins[1] + coins[2] + coins[4] + coins[5] = 16 coins.
# 3rd hero: [1,2,4] since the power of this hero is 2 and monsters[1], monsters[2], monsters[4] <= 2. So this hero collects coins[1] + coins[2] + coins[4] = 10 coins.
# So the answer would be [5,16,10].

# Example 2:
# Input: heroes = [5], monsters = [2,3,1,2], coins = [10,6,5,2]
# Output: [23]
# Explanation: This hero can defeat all the monsters since monsters[i] <= 5. So he collects all of the coins: coins[1] + coins[2] + coins[3] + coins[4] = 23, and the answer would be [23].

# Constraints:
# 1 <= n == heroes.length <= 105
# 1 <= m == monsters.length <= 105
# coins.length == m
# 1 <= heroes[i], monsters[i], coins[i] <= 109
 
# Solution:

def max_coins(heroes, monsters, coins)
  # we want to sort the monsters and coins arrays by the power of the monster in ascending order
  sorted_monsters = monsters.zip(coins).sort_by { |monster, _| monster }
  # we want to create a prefix sum array to store the power of the monster and the coins that the hero can collect
  prefix_sum = []
  # current sum set to 0 as we don't have one yet
  current_sum = 0

  sorted_monsters.each do |monster, coin| # we want to iterate through the sorted monsters array
    current_sum += coin # we want to add the coin to the current sum
    prefix_sum << [monster, current_sum] # we want to add the monster and the current sum to the prefix sum array
  end

  # we want to iterate through the heroes array and compare the power of the hero to the power of the monster
  heroes.map do |hero|
    # we want to use bsearch_index to find the index of the first element where the monster is greater than the hero
    idx = prefix_sum.bsearch_index { |monster, _| monster > hero }
    idx = idx.nil? ? prefix_sum.size - 1 : idx - 1
    idx >= 0 ? prefix_sum[idx][1] : 0
  end
end