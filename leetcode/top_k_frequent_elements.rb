def top_k_frequent(nums, k)
  hash = {}
  nums.each do |n|
    hash[n] = 0 if !hash.key?(n)
      hash[n] += 1
    end
    freq = hash.sort_by { |k, v| v }.reverse
    res = freq.first(k).map { |k, v| k }

    res
end

def top_k_frequent(nums, k)
  hash = Hash.new(0)
  nums.each { |n| hash[n] += 1 }
  
  hash.keys.sort_by { |key| -hash[key] }.first(k)
end

#faster 

def top_k_frequent(nums, k)
	nums_hash = nums.each.tally
    nums_hash.sort_by { |n, count| -count }.first(k).map(&:first)
end