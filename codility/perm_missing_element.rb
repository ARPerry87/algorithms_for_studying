def perm_missing_element(a)
  return 1 if a.size == 0

  sum = a.reduce(:+)
  n = a.size + 1
  expected_sum = (n * (n + 1)) / 2
  res = expected_sum - sum
  res == 0 ? n : res
end