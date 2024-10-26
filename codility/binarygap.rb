#binary gap solution in ruby

def binary_gap(n)
  bin = n.to_s(2)
  gap = 0
  one = bin.index('1')

  for i in 1..(bin.size-1)
    current_string = bin[one..i].to_s
    if bin[i] == '1'
      one = i
      count_zeros = current_string.count('0')
      if gap < count_zeros
        gap = count_zeros
      end
    end
  end
  return gap
end 