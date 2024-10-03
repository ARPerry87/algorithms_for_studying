# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)

  occurrences = {}
  leader = nil
  max_occurrences = 0
  a.each do |e|
    occurrences[e] = occurrences[e] || 0
    occurrences[e] += 1
    if occurrences[e] >= max_occurrences
      max_occurrences = occurrences[e]
      leader = e
    end
  end
  
  return -1 if max_occurrences <= a.length / 2
  
  a.each_with_index do |e, i|
    return i if e == leader
  end

end

#can also do it this way but it's not as efficent and harder to read

def solution(a)
  n = a.size
  size = 0
  value = 0
  a.each do |e|
    if size == 0
      size += 1
      value = e
    else
      if value != e
        size -= 1
      else
        size += 1
      end
    end
  end
  candidate = -1
  leader = -1
  if size > 0
    candidate = value
  end
  count = 0
  a.each do |e|
    count += 1 if e == candidate
  end
  if count > n / 2
    leader = candidate
  end
  a.each_with_index do |e, i|
    return i if e == leader
  end
  -1
end