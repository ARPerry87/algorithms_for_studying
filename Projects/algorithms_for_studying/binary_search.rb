def binary_search(arr, key)
  lo = 0
  high = arr.length - 1 

  while (lo <= high)
    mid = lo+((high-lo)/2)

    if a[mid] == key
      return mid
    elsif a[mid] < key
      lo=mid+1
    else 
      high = mid - 1
    end
  end
  return "value not found"
end