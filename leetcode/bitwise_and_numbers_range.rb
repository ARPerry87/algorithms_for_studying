def bitwise_range_and(left, right)
  d = (right - left).bit_length
  r = right.bit_length

  mask = (1 << r) - (1 << d)
  left & right & mask
end

#faster solution

def range_bitwise_and(left, right)
  shift = 0

  while left < right
    left >>= 1
    right >>= 1
    shift += 1
  end
  left << shift
end