def contains_duplicates(nums)
  # we create a new hash
  # we then iterate over the array
  # we then check if the hash has the current element
  # if it does we return true
  # if it doesn't we add the element to the hash
  # we then return false
  hash = {}
  nums.each do |num|
    return true if hash[num]
    hash[num] = true
  end
  false
end

#now with each with index 

def contains_duplicates(nums)
  hash = {}
  nums.each_with_index do |num, index|
    return true if hash[num]
    hash[num] = index
  end
  false
end

# now with each_with_object

def contains_duplicates(nums)
  nums.each_with_object(Set.new) do |num, set|
    return true unless set.add?(num)
  end.empty?
end

def contains_duplicates(nums)
  hashset = Set.new
  for n in nums
    if hashset.include?(n)
      return true
    end
    hashset.add(n)
  end
  return false
end