def solution(a, b)
  up_stream = []
  down_stream_living = 0

  for i in 0..a.count-1
    if b[i] == 0
      while up_stream.any? do
        if a[i] < up_stream.last
          break
        else
          up_stream.pop
        end
      end
      down_stream_living += 1 if up_stream.empty?
    else
      up_stream << a[i]
    end
  end
  down_stream_living + up_stream.count
end