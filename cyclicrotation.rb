def solution(a, k)
  unless a.empty?
    for i in 1..k
      last = a.pop
      a.unshift(0, last)
    end
  end
  return a 
end