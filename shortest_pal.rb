def shortest_palindrome(s)
  original = s.clone
  letters = ""
  size = original.size
  index = 1
  while true
      break if s == s.reverse
      letters = letters+original[size-index]
      s[size-index] = ""
      index+= 1
  end

  return letters+original
  
end
