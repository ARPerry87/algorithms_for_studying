def solution(s)
  stack = []
  brackets = { ')' => '(', ']' => '[', '}' => '{' }
  s.chars.each do |c|
    stack.push(c) if brackets.values.include?(c)
    if brackets[c]
      return 0 if brackets[c] != stack[-1]
      stack.pop
    end
  end
  stack.empty? ? 1 : 0
end

# can also do it this way
def solution(s)
  return 0 if s.length.odd?
  matched = {"]" => "[", "}" => "{", ")" => "("}
  to_push = ["[", "{", "("]
  stack = []
  s.each_char do |element|
    if to_push.include?(element)
      stack.push(element)
    else
      return 0 if stack.empty?
      return 0 if matched[element] != stack.pop
    end
  end
  stack.empty? ? 1 : 0
end

