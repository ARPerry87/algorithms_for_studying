def solution(arr)
  unique_n = arr.uniq

  unique_n.each do |e|
    if a.count(e).odd?
      return e
    end
  end
end