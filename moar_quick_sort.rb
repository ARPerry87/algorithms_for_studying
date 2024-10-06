# learn this dammit learn it

# Quick Sort
# 1. If the array has one element, return the array
# 2. Pick a pivot element
# 3. Partition the array into two halves, one with elements less than the pivot and one with elements greater than the pivot
# 4. Recursively call quick_sort on the left half of the array
# 5. Recursively call quick_sort on the right half of the array
# 6. Repeat
# 7. Profit

def quick_sort(arr)
  return arr if arr.length <= 1
  pivot = arr.delete_at(rand(arr.length))
  left = arr.select{|el| el < pivot}
  right = arr.select{|el| el >= pivot}
  quick_sort(left) + [pivot] + quick_sort(right)
end

arr = [1, 45, 3, 22, 56, 89, 100, 12, 15]
pp quick_sort(arr)

# can we make this better?
# we can use the partition method to split the array into two halves
# we can also use the sample method to pick a random element from the array
# we can also use the splat operator to merge the three arrays together

def better_quick_sort(arr)
  return [] if arr.empty?

  temp = arr.dup

  pivot = temp.delete_at(rand(temp.length))
  left, right = temp.partition{|i| i < pivot }

  return [better_quick_sort(left), pivot, better_quick_sort(right)].flatten
end

arr = [1, 45, 3, 22, 56, 89, 100, 12, 15]
pp better_quick_sort(arr)