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

  leader_occurrences = []
  leader_occurence = 0
  a.each_with_index do |e, index|
    leader_occurence += 1 if e == leader
    leader_occurrences.push leader_occurence
  end
  
  equi_leaders = []
  a.each_with_index do |e, index|
    first_half_leader = leader_occurrences[index] > ((index + 1)/2)
    second_half_leader = (leader_occurrences.last - leader_occurrences[index]) > ((a.length - (index + 1))/2)    
    if first_half_leader && second_half_leader
      equi_leaders << index
    end
  end
  equi_leaders.length
end

# can also be done this way but it is very lengthy and hard to read 
# however it is faster than the above solution due to reduction of nested conditionals


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
  leader_occurrences = []
  leader_occurence = 0
  a.each_with_index do |e, index|
    leader_occurence += 1 if e == leader
    leader_occurrences.push leader_occurence
  end
  
  equi_leaders = []
  a.each_with_index do |e, index|
    first_half_leader = leader_occurrences[index] > ((index + 1)/2)
    second_half_leader = (leader_occurrences.last - leader_occurrences[index]) > ((a.length - (index + 1))/2)    
    if first_half_leader && second_half_leader
      equi_leaders << index
    end
  end
  equi_leaders.length
end