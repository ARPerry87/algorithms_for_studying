def solution(n)
  Math.sqrt(n).to_i.downto(1) do |i|
    return 2 * (i + n / i) if n % i == 0
  end
end