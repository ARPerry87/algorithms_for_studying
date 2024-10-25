# This is a template to show the use of backtracking in algorithm problems

def solution(nums)
  result = [] # initialize an empty array to hold the result
  backtrack(nums, [], result) # start the backtracking process
  result # return the final result
end

def backtrack(nums, path, result)
  if path.length == nums.length # base case: if the path length equals the input length
    result << path.clone # add a copy of the current path to the result
    return # backtrack
  end

  nums.each do |num| # iterate through each number in the input
    next if path.include?(num) # skip if the number is already in the path
    path << num # choose the number
    backtrack(nums, path, result) # recurse with the updated path
    path.pop # backtrack: remove the last number added
  end
end