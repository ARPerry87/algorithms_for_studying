def binary_search(arr, key)
  low = 0
  high = arr.length - 1

  while low <= high 
    mid = low + ((high - low) / 2).floor

    if arr[mid] == key
      return mid
    elsif arr[mid] < key
      low = mid + 1 
    else
      high = mid - 1
    end
  end
  "value not found"
end

arr = [1,2,13, 22, 55, 89]
pp binary_search(arr, 22)
pp binary_search(arr, 101)
