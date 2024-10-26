def passing_cars(a)
  multi = 0
  sum = 0
  a.each do |v|
    if v == 0
      multi += 1
    else
      sum += multi
    end
  end
  return sum unless sum > 1_000_000_000
  -1
end