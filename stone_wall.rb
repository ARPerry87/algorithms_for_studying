
def solution(h)
  stack = []
  block_count = 0
  h.each do |height|
    while !stack.empty? && height < stack.last
      stack.pop
      block_count += 1
    end
    if stack.empty? || height > stack.last
      stack.push(height)
    end
  end
  block_count += stack.length
  return block_count
end

