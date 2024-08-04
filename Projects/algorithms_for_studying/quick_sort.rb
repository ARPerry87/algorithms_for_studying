class Array
  def quicksort
    return [] if empty?

    #[34,4,2,5,3]
    #[32, 2, 5, 3]
    #delete_at pulls the value out and assigns pivot that value, in this case 4
    pivot = delete_at(rand(size))
    #this will look at the values with the greater than method, so everything that's to the left of the pivot, put inside the left variable and vice versa
    #this will also sort them according to the values in the variables
    left, right = partition(&pivot.method(:>))

    return *left.quicksort, pivot, *right.quicksort
  end
end

#or if not wanting to meta-program 

def quicksort(arr)
  return [] if arr.empty?

  pivot = arr.delete_at(rand(arr.length))
  left, right = arr.partition{|i| i < pivot }

  return [quicksort(left), pivot, quicksort(right)].flatten
end