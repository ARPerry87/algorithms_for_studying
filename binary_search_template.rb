# A binary search template for solving binary search questions

def binary_search(arr, target)
  left = 0 # initialize the left pointer at 0
  right = arr.length - 1 # initialize the right pointer at the last index of the array

  while left <= right # continue the loop while left pointer is less than or equal to right pointer
    mid = left + (right - left) / 2 # calculate the mid index

    if arr[mid] == target # check if the middle element is the target
      return mid # return the mid index if found
    elsif arr[mid] < target # if the middle element is less than the target
      left = mid + 1 # move the left pointer to mid + 1
    else
      right = mid - 1 # move the right pointer to mid - 1
    end
  end

  return -1 # target not found
end