def solution(a)
  total_sum = (1..(a.count+1)).reduce(:+)
  total_arr = a.reduce(:+) || 0
  total_sum - total_arr
end