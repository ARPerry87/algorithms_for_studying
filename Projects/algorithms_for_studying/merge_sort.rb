def merge_sort(arr)
  if arr.length <= 1 
    arr
  else
    mid = (arr.length / 2).floor #so ruby doesn't round
    left = merge_sort(arr[0..mid - 1])
    right = merge_sort(arr[mid..arr.length])
    merge(left, right)
  end
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


arr = [1,45,3,22,56,89,100,12,15]

pp merge_sort(arr)