# Leetcode link: https://leetcode.com/problems/time-taken-to-cross-the-door/
# there are n persons from 0 to n-1 and a door. Each person can enter or exit through the door once, taking one second.
# You are given a non-decreasing integer array arrival of size n, where state[i] is 0 if person i wants to enter through the door or 1 if they want to exit through it.
# 
# If two or more persons want to use the door at the same time, they follow the following rules: 
# if the door was not used in the previous second, then the person who wants to exit goes first. 
# if the door was used in the previous second for entering, the person who wants to enter goes first. 
# If the door was used in the previous second for exiting, the person with the smallest index goes first.
#
# Return an array answer of size n where answer[i] is the second at which the ith person will pass through the door.
# note that: 
# Only one person can cross the door at each second. 
# A person may arrive at the door and wait without entering or exitign to follow the mentioned rules. 
# 
# Example 1:
# Input: arrival = [0, 1, 1, 2, 4] state = [0, 1, 0, 0, 1]
# Output: [0, 3, 1, 2, 4]
# Explanation: - At t = 0: Person 0 is the only one who wants to enter, so they just enter through the door.
# - At t = 1: Person 1 wants to exit, and person 2 wants to enter. Since the door was used the previous second for entering, person 2 enters.
# - At t = 2: Person 1 still wants to exit, and person 3 wants to enter. Since the door was used the previous second for entering, person 3 enters.
# - At t = 3: Person 1 is the only one who wants to exit, so they just exit through the door.
# - At t = 4: Person 4 is the only one who wants to exit, so they just exit through the door.


# Solution:

def time_taken(arrival, state)
  #using two queues to store the index of the person who wants to enter and exit
  enter_queue = Queue.new
  exit_queue = Queue.new    
  # previous_state is used to keep track of the previous state of the door
  previous_state = 1
  # i is used to iterate through the arrival array and we want to start it at 0 because we want to start at the first person
  i = 0 
  # our n variable is used to store the length of the arrival array which we'll use to create the answer array
  n = arrival.length
  # curr_time is used to keep track of the current time
  curr_time = 0 
  # we want to create an array of size n and set all the values to 0, this will be our answer array
  ans = Array.new(n, 0)

  while(i < n || !enter_queue.empty? || !exit_queue.empty?) do 
      # add elements to enter/exit queue with same arrival time 
      while(i < n and arrival[i] <= curr_time) do 
          if state[i] == 0
              enter_queue << i
          else
              exit_queue << i
          end 
          i += 1
      end
      if previous_state == 1
          if !exit_queue.empty?
              ans[exit_queue.pop] = curr_time
          elsif !enter_queue.empty?
              ans[enter_queue.pop] = curr_time
              previous_state = 0             
          end   
      else
          if !enter_queue.empty?
              ans[enter_queue.pop] = curr_time                 
          elsif !exit_queue.empty?
              ans[exit_queue.pop] = curr_time
              previous_state = 1 
          else
              previous_state = 1
          end 
      end 
      curr_time += 1
  end 
  ans 

end