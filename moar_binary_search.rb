# learn this dammit learn it
 
# Binary Search
# 1. Create a left and right pointer
# 2. While the left pointer is less than or equal to the right pointer, do the following:
#  a. Find the middle index
#  b. If the middle element is the target, return the middle index
#  c. If the middle element is less than the target, move the left pointer to the middle index + 1
#  d. If the middle element is greater than the target, move the right pointer to the middle index - 1
#  e. Repeat
#  f. If the target is not found, return -1
#  g. Profit

def binary_search(arr, target)
  middle = arr.length / 2
  left = 0
  right = arr.length - 1

  while left < right 
    if arr[middle] == target
      return middle
    elsif arr[middle] < target
      left = middle + 1
      middle = (left + right) / 2
    else
      right = middle - 1
      middle = (left + right) / 2
    end
  end
  false
end