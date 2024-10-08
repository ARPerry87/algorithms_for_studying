def two_sum(nums, target)
  hash = {}
  nums.each_with_index do |n, i|
    diff = target - n
    return hash[diff], i if hash[diff]
    hash[n] = i
  end
  nil
end