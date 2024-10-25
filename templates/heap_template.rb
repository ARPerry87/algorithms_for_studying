# This is a template for using heaps to sort and to solve algorithm problems

# using the Heapify gem for heap operations

def solution(arr)
  heap = Heap.new(arr) # initialize a heap with the input array
  result = [] # initialize an empty array to hold the result

  until heap.empty? # continue until the heap is empty
    result << heap.pop # remove the smallest element from the heap and add it to the result
  end

  result # return the sorted result
end