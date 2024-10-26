def solution(a)
  max_slice_end = a[0]
  max_slice = a[0]
  a[1..-1].each do |element|
    max_slice_end = [element, max_slice_end + element].max
    max_slice = [max_slice, max_slice_end].max
  end
  max_slice
end

# refactored a bit

def solution(a)
  max_ending, max_slice = a[0], a[0]
  a[1..-1].each do |e|
    max_ending = [e, max_ending + e].max
    max_slice = [max_slice, max_ending].max
  end
  max_slice
end

#lets see if we can make it faster

def solution(a)
  max_slice_end = a[0]
  max_slice = a[0]
  a.each_with_index do |element, index|
    next if index == 0
    max_slice_end = [element, max_slice_end + element].max
    max_slice = [max_slice, max_slice_end].max
  end
  max_slice
end