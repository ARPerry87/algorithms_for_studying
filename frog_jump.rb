def solution(x, y, z)
  if x == y
    return 0
  else
    return (Float(y-x)/z).ceil
  end
end