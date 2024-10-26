def count_div(a, b, k)
  first_d = a > 0 ? a % k + a : 0
  first_d = k if a > 0 && k > a

  return 0 if first_d > b && a != 0

  last_d = b - b % k
  return 0 if b < first_d
  (last_d - first_d) / k + 1
end