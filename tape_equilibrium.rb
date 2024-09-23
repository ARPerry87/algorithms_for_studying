def solution(arr)
  left = 0
  right = a.reduce(:+)
  difference = []

  for i in 1..(a.size-1) do
    left += a[i-1]
    right -= a[i - 1]
    absolute = (left - right).abs
    dfference << absolute
  end
  difference.min
end