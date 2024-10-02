def solution(x, y, z)
  return 0 if y == x
  ((y.to_f - x) / z).ceil
end