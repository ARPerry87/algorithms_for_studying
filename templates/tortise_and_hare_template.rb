# This is to serve as a template for using the Tortise and Hare algorithm 
# This algorithm is used to detect cycles in a linked list

def find_duplicate(nums)
  tortoise = nums[0]
  hare = nums[0]

  # Step 1: Finding the intersection point in the cycle
  begin
    tortoise = nums[tortoise]
    hare = nums[nums[hare]]
  end while tortoise != hare

  # Step 2: Find the entrance to the cycle
  tortoise = nums[0]
  while tortoise != hare
    tortoise = nums[tortoise]
    hare = nums[hare]
  end

  tortoise
end