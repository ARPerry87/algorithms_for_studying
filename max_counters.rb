def max_counters(n, a)
  counters = Array.new(n, 0)
  max = 0
  all_counters_same = true

  a.each do |v|
    if v == n + 1
      counters = Array.new(n, max) unless all_counters_same
      all_counters_same = true
    else 
      counters[v - 1] += 1
      max = counters[v - 1] if counters[v - 1] > max
      all_counters_same = false
    end
  end
  counters
end