# Leetcode link: https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/
# Description: You are given a list of songs where the ith song has a duration of time[i] seconds. Return the number of pairs of songs for which their total duration in seconds is divisible by 60. Formally, we want the number of indices i, j such that i < j with (time[i] + time[j]) % 60 == 0.
# Example 1:
# Input: time = [30,20,150,100,40]
# Output: 3
# Explanation: Three pairs have a total duration divisible by 60:
# (time[0] = 30, time[2] = 150): total duration 180
# (time[1] = 20, time[3] = 100): total duration 120
# (time[1] = 20, time[4] = 40): total duration 60
# Example 2:
# Input: time = [60,60,60]
# Output: 3
# Explanation: All three pairs have a total duration of 120, which is divisible by 60.

# Solution:

def num_pairs_divisible_by60(time)
  pairs_counter = 0 # initialize the pairs_counter
  reminders = Array.new(60,0) # initialize the reminders array with 60 elements all set to 0
  time.each do |el| # iterate through the time array
    reminder = el % 60 # get the reminder of the current element
    if 0 == reminder # if the reminder is 0
      pairs_counter += reminders[0] # increment the pairs_counter by the value of the reminders at index 0
    else
      pairs_counter += reminders[60-reminder] # increment the pairs_counter by the value of the reminders at index 60 - reminder
    end
    reminders[reminder] += 1 # increment the reminders at the reminder index
  end
  pairs_counter # return the pairs_counter
end

def num_pairs_divisible_by60(time)
  pairs = 0 
  remainders = Array.new(60, 0)
  time.each do |t|
    remainder = t % 60
    if remainder == 0
      pairs += remainder[0] # because this is already divisible by 60 no need to increment the remainders array
    else 
      pairs =+ remainders[60 - remainder]
    end
    remainders[remainder] += 1
  end
  pairs
end

def num_pairs_divisible_by60(time)
  pairs = 0
  remainders = Array.new(60, 0)
  time.each do |t|
    remainder = t % 60
    if remainder == 0
      pairs += remainder[0] # because this is already divisible by 60 no need to increment the remainders array
    else 
      pairs += remainders[60 - remainder] # increment the pairs by the value of the remainders at 60 - remainder
    end
    remainders[remainder] += 1
  end
  pairs
end