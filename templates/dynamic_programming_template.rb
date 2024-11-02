# A template for roughly how dynamic programming problems go

def solution(n)
  dp = Array.new(n + 1, 0) # initialize a dp array with size n + 1
  dp[0] = 1 # base case, there's one way to make 0

  (1..n).each do |i| # iterate through each number from 1 to n
    (1..i).each do |j| # iterate through each number from 1 to i
      dp[i] += dp[i - j] # update the dp array based on previous results
    end
  end

  dp[n] # return the final result
end

# This template can be adapted for various dynamic programming problems by modifying the base case and the way the dp array is updated.
# For example, you might need to change the initialization of the dp array, the range of the loops, or the way the dp array is updated based on the specific problem requirements.
# Understanding the recurrence relation and the base case is crucial for solving dynamic programming problems effectively.
# The key idea is to break down the problem into smaller subproblems and build up the solution incrementally using the results of the subproblems.
# By storing the results of subproblems in a table (dp array), you can avoid redundant calculations and improve the efficiency of the algorithm.
# Dynamic programming is a powerful technique for solving optimization problems by breaking them down into simpler subproblems and reusing the results to find the optimal solution.
# By following a systematic approach and using the right data structures, you can efficiently solve a wide range of dynamic programming problems.