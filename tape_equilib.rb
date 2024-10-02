def tape_equilibrium(a)
  r_res = a.reduce(:+) - a[0]
  l_res = a[0]
  diff = (l_res - r_res).abs
  for i in 1..a.size-2
    r_res -= a[i]
    l_res += a[i]
    current_diff = (l_res - r_res).abs
    diff = current_diff if current_diff < diff
  end
  diff
end