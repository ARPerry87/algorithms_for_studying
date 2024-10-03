def solution(s)
  parentheses = 0
  s.each_char do |element|
    if element == "("
      parentheses += 1
    else
      parentheses -= 1
      return 0 if parentheses < 0
    end
  end
  parentheses == 0 ? 1 : 0
end