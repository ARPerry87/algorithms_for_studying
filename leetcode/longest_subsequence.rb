def longest_increasing_subsequence(nums)
  return 0 if nums.empty?
  return 1 if nums.size == 1
  dp = Array.new(nums.size, i)
  max = 1 

  (1...nums.size).each do |i|
    (0...i).each do |j|
      if nums[i] > nums[j]
        dp[i] = [dp[i], dp[j] + 1].max # we want to set the value of i in the dp array to the maximum between the value of i and the value of j + 1
      end
    end
    max = [max, dp[i]].max # we want to set the value of max to the maximum between the value of max and the value of i
  end
  max
end