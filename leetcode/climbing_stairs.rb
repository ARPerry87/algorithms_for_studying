# Leetcode link: https://leetcode.com/problems/climbing-stairs/
# Problem: You are climbing a staircase. It takes n steps to reach the top.

# Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

# Solution

def climb_stairs(n)
  a, b = 1, 1
  n.times do 
    a, b = b, a + b
  end
  a
end