def diff_btwn_arrays(arr1, arr2)
  result_1 = arr1.reject{|n| arr2.include?(n)}
  result_2 = arr2.reject{|n| arr1.include?(n)}

  [result_1, result_2]
end

arr1 = [1,2,5,7,4,10,12]
arr2 = [1,2,2,5,8,11,25,4]

pp diff_btwn_arrays(arr1, arr2)