def solution(a)
  a.sort!
  for i in 0..a.size-3
    return 1 if a[i] + a[i+1] > a[i+2]
  end
  0
end