# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def frog_river_one(x, a)
  h = Hash[(1..x).each_with_object(true).to_a]
  a.each_with_index do |e, i|
    h.delete(e)
    return i if h.empty?
  end
 -1
end

require 'minitest/autorun'
class Tests < Minitest::Test
  def test_example_input
    assert_equal 6, solution(5, [1, 3, 1, 4, 2, 3, 5, 4])
  end

  def test_not_possible
    assert_equal(-1, solution(5, [1, 2, 1, 2, 1, 4, 5]))
  end

  def test_immediately
    assert_equal 0, solution(1, [1, 1])
  end
end