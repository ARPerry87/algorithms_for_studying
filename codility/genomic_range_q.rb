
def solution(s, p, q)
  res = []
  (0...p.length).each do |i|
    if s[p[i]..q[i]].include?('A')
      res << 1
    elsif s[p[i]..q[i]].include?('C')
      res << 2
    elsif s[p[i]..q[i]].include?('G')
      res << 3
    else
      res << 4
    end
  end
  res
end

