# A template for creating two pointers in ruby to solve algo problems

def two_pointer(arr)
  left, right = 0, arr.length - 1 # initialize two pointers
  result = [] # initialize an empty array to hold the result

  while left < right # continue until the two pointers meet
    # process the elements at the two pointers
    result << [arr[left], arr[right]] # example: store the pair of elements

    left += 1 # move the left pointer to the right
    right -= 1 # move the right pointer to the left
  end
  result # return the result
end