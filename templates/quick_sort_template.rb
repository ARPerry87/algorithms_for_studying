# A template for quick sort

def quick_sort(arr)
  return arr if arr.length <= 1 # return if the array is already sorted

  pivot = arr[arr.length / 2] # choose a pivot element
  left = arr.select { |x| x < pivot } # elements less than the pivot
  middle = arr.select { |x| x == pivot } # elements equal to the pivot
  right = arr.select { |x| x > pivot } # elements greater than the pivot

  quick_sort(left) + middle + quick_sort(right) # recursively sort and concatenate
end