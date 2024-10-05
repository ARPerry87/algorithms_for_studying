def solution(n)
  candidate = 1
  res = 0
  while candidate * candidate <= n
    if n % candidate == 0
      res += 1
      res += 1 if candidate * candidate < n
    end
    candidate += 1
  end
  return result
end