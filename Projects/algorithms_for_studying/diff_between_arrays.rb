def diff_btwn_arrays(arr1, arr2)
  result_1 = arr1.reject{|n| arr2.include?(n)}
  result_2 = arr2.reject{|n| arr1.include?(n)}

  [result_1, result_2]
end

arr1 = [1,2,5,7,4,10,12]
arr2 = [1,2,2,5,8,11,25,4]

pp diff_btwn_arrays(arr1, arr2)

#if the want is to sort AND have the results in a new array

def diff_arrays(arr1, arr2)
  res_1 = arr1.reject{|n| arr2.include?(n)}
  res_2 = arr2.reject{|n| arr1.include?(n)}

  result_arr = [res_1, res_2].flatten.sort
  return result_arr
end

arr1 = [1,2,5,7,4,10,12]
arr2 = [1,2,2,5,8,11,25,4]

pp diff_arrays(arr1, arr2)
