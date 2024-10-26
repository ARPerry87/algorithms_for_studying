# Leetcode link: https://leetcode.com/problems/minimum-increment-to-make-array-unique/
# Description: Given an array of integers A, a move consists of choosing any A[i], and incrementing it by 1.
# Return the least number of moves to make every value in A unique.
# Example 1:
# Input: [1,2,2]
# Output: 1
# Explanation: After 1 move, the array could be [1, 2, 3].
# Example 2:
# Input: [3,2,1,2,1,7]
# Output: 6
# Explanation: After 6 moves, the array could be [3, 4, 1, 2, 5, 7].
# It can be solved using a greedy approach
# The idea is to sort the array and iterate through the array

def min_increment_for_unique(nums)
  nums.sort!
  res = 0

  (1...nums.size).each do |i|
    if nums[i - 1] >= nums[i]
      res += nums[i - 1] - nums[i] + 1
      nums[i] = nums[i - 1] + 1
    end
  end
  res
end

# or

def min_increment_for_unique(nums)
  nums.sort!
  last = nums[0] - 1

  nums.sum{ |n|
      last += 1
      last = n if n > last
      last - n
  }
end

# easier to read

def min_increment_for_unique(nums)
  nums.sort!

  possible_num = 0 # the intial possible number
  moves = 0 # the initial moves
  nums.each do |num|
    if possible_num >= num # if the possible number is greater than or equal to the current number
      moves += possible_num - num # we can add the difference from possible number and the current number to the moves
    else
      possible_num = num # if the possible number is less than the current number, we can set the possible number to the current number
    end
    
    possible_num += 1 # we can then increment the possible number by 1
  end

  moves # we can return the moves
end

# or, this one is slower with smaller datasets than the ones above but it's easier to read and faster with larger datasets

def possible_num(nums)
  count = nums.each_with_object(Hash.new(0)) { |num, hash| hash[num] += 1 }
  res = 0

  for i in 0...(nums.length + nums.max) |i|
    if count[i] > 1
      extra = count[i] - 1
      count[i + 1] += extra
      res += extra
    end
  end
  return res
end