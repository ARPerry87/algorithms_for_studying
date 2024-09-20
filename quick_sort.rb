def quicksort(arr)
  return [] if arr.empty?

  temp = arr.dup

  pivot = temp.delete_at(rand(temp.length))
  left, right = temp.partition{|i| i < pivot }

  return [quicksort(left), pivot, quicksort(right)].flatten
end

arr = [1, 2, 5, 23, 99, 21, 24, 33]
pp quicksort(arr)