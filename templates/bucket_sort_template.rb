# This is to create a template for bucket sort in Ruby 

def bucket_sort(arr, bucket_size = 5)
  return arr if arr.length <= 1 # return if the array is already sorted

  min_val = arr.min # find the minimum value in the array
  max_val = arr.max # find the maximum value in the array
  bucket_count = ((max_val - min_val) / bucket_size).ceil + 1 # calculate the number of buckets needed based on the range of values and bucket size
  buckets = Array.new(bucket_count) { [] } # create an array of empty buckets based on the bucket count

  arr.each do |num| # distribute the elements into the buckets
    bucket_index = ((num - min_val) / bucket_size).floor # find the appropriate bucket index for the number
    buckets[bucket_index] << num # add the number to the corresponding bucket
  end

  buckets.each do |bucket|
    bucket.sort! # sort each bucket
  end

  buckets.flatten # concatenate all the buckets into a single sorted array
end