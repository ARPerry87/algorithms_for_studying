# Make a prefix sum template for algorithm problems that use them (a surprising amount)

def solution(arr)
  prefix_sum = Array.new(arr.length + 1, 0) # initialize a prefix sum array with size arr.length + 1 and fill with 0

  (1..arr.length).each do |i| # iterate through each element in the original array
    prefix_sum[i] = prefix_sum[i - 1] + arr[i - 1] # calculate the prefix sum
  end

  prefix_sum # return the prefix sum array
end