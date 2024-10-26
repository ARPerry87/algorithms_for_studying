def solution(a)
  a.sort!
  v1 = a[-1] * a[-2] * a[-3]
  if a.size > 3
    v2 = a[0] * a[1] * a[-1]
    [v1, v2].max
  else
    v1
  end
end