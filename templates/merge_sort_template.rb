# A template for using merge sort algorithm

def merge_sort(arr)
  return arr if arr.length <= 1 # return if the array is already sorted

  mid = arr.length / 2 # find the middle index
  left_half = merge_sort(arr[0...mid]) # recursively sort the left half
  right_half = merge_sort(arr[mid...arr.length]) # recursively sort the right half

  merge(left_half, right_half) # merge the sorted halves
end

def merge(left, right)
  sorted = [] # initialize an empty array to hold the sorted elements
  until left.empty? || right.empty? # continue until one of the halves is empty
    if left.first <= right.first # compare the first elements of both halves
      sorted << left.shift # add the smaller element to the sorted array
    else
      sorted << right.shift # add the smaller element to the sorted array
    end
  end
  sorted + left + right # concatenate any remaining elements
end