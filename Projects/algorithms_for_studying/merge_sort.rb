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

#if not watning to do do array class

def merge_sort(arr)
  if arr.length <= 1 
    arr
  else
    mid = (arr.length / 2).floor #so ruby doesn't round
    left = merge_sort(arr[0..mid - 1])
    right = merge_sort(arr[mid..arr.length])
    merge(left, right)
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.length], right)
  else right.first < left.first
    [right.first] + merge(left, right[1..right.length])
  end
end