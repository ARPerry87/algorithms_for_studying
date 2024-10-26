def missing_int(a)
  h = Hash.new
  return 1 if h.empty?

  max = 1
  a.each do |v|
    if v > 0
      h[v] = true
      max = [max, v].max
    end
  end
  for v in 1..max
    return i if h[v].nil?
  end
  max + 1
end