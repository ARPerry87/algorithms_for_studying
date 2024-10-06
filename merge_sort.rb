def merge_sort(arr)
  return arr if arr.length <= 1
  mid = (arr.length / 2).floor
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
  elsif right.first < left.first
    [right.first] + merge(left, right[1..right.length])
  end
end


arr = [1,45,3,22,56,89,100,12,15]

pp merge_sort(arr)

#can we make this better?
# we can use the spaceship operator to compare the two arrays
# we can also use the shift method to remove the first element of the array
# we can also use the splat operator to merge the two arrays together


def merge_sort(arr)
  return arr if arr.length <= 1
  mid = (arr.length / 2).floor
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid...arr.length])

  merge(left, right)
end

def merge(left, right)
  sorted = []
  until left.empty? || right.empty?
    if (left.first <=> right.first) == -1
      sorted << left.shift
    else
      sorted << right.shift
    end
  end
  sorted + left + right
end

arr = [1, 45, 3, 22, 56, 89, 100, 12, 15]

pp merge_sort(arr)