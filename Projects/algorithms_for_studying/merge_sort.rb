class Array

  # [4,6,7,5,8,7]
  def merge_sort
    return [] if empty? || self.length = 1

    mid = self.length / 2

    left = self.take(mid)
    right = self.drop(mid)

    sorted_left = left.merge_sort
    sorted_right = right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    sorted = []

    until left.empty? || right.empty?
      if left.first < right.first
        sorted << left.shift
      elsif left.first == right.first
        sorted << left.shift
        sorted << right.shift
      elsif right.first < left.first
        sorted << right.shift
      end
    end
    
    sorted + left + right
  end
end