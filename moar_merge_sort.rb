# learn this dammit learn it

# Merge Sort
# 1. If the array has one element, return the array
# 2. Find the middle index
# 3. Recursively call merge_sort on the left half of the array
# 4. Recursively call merge_sort on the right half of the array
# 5. Merge the left and right halves
# 6. Repeat
# 7. Profit

def merge_sort(arr)
  if arr.length <= 1
    return arr
  else 
    mid = arr.length / 2
    first_half = merge_sort(arr[0..mid - 1])
    second_half = merge_sort(arr[mid..arr.length])
    merge(first_half, second_half)
  end
end

def merge(left, right)
  sorted_arr = []
  until left.empty? || right.empty?
    if left.first < right.first
      sorted_arr << left.shift
    else 
      sorted_arr << right.shift
    end
  end
  return sorted_arr + left + right
end