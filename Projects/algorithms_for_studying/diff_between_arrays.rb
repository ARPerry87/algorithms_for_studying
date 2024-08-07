def diff_btwn_arrays(arr1, arr2)
  result_1 = arr1.reject{|n| arr2.include?(n)}
  result_2 = arr2.reject{|n| arr1.include?(n)}

  [result_1, result_2]
end