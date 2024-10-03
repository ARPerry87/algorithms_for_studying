def solution(a)
  a[0] = 0
  a[-1] = 0

  max_from_left = []
  max_ending = 0
  a.each do |v|
    max_ending = [0, max_ending + v].max
    max_from_left << max_ending
  end
  
  max_from_right = []
  max_ending = 0
  a.reverse.each do |v|
    max_ending = [0, max_ending + v].max
    max_from_right << max_ending
  end
  max_from_right.reverse!

  n = a.size
  max_double_slice = 0
  for i in 1..n-2
    max_double_slice = [max_double_slice, max_from_left[i - 1] + max_from_right[i + 1]].max
  end

  max_double_slice

end

#make this faster?

def solution(a)
  n = a.size
  return 0 if n < 4

  max_ending_here = Array.new(n, 0)
  max_starting_here = Array.new(n, 0)

  (1...n-1).each do |i|
    max_ending_here[i] = [0, max_ending_here[i-1] + a[i]].max
  end

  (n-2).downto(1) do |i|
    max_starting_here[i] = [0, max_starting_here[i+1] + a[i]].max
  end

  max_double_slice = 0
  (1...n-1).each do |i|
    max_double_slice = [max_double_slice, max_ending_here[i-1] + max_starting_here[i+1]].max
  end

  max_double_slice
end