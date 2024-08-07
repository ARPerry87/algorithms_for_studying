def binary_search(arr, key)
  low = 0
  high = arr.length - 1

  while lo <= high 
    mid = low + ((high - low) / 2)

    if a[mid] == key
      return mid
    elsif a[mid] < key
      low = mid + 1 
    else
      high = mid - 1
    end
  end
  "value not found"
end