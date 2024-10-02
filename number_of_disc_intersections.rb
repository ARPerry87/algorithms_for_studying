r
def solution(a)
  discs_count = a.length            
  range_upper = Array.new(discs_count, 0)   
  range_lower = Array.new(discs_count, 0)   
  
  # Fill the limit_upper and limit_lower
  (0...discs_count).each do |index|
    range_upper[index] = index + a[index]
    range_lower[index] = index - a[index]
  end
  
  range_upper.sort!
  range_lower.sort!
  
  range_lower_index = 0
  intersect_count = 0
  
  (0...discs_count).each do |range_upper_index|
    # Compute for each disc
    while range_lower_index < discs_count && 
          range_upper[range_upper_index] >= range_lower[range_lower_index]
          range_lower_index += 1
    end

    intersect_count += range_lower_index - range_upper_index - 1
    
    if intersect_count > 10_000_000
      return -1
    end
  end
  
  return intersect_count
end

