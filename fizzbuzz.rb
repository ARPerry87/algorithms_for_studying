# Just because 
# One of the first things I learned how to code
# Thanks Wayne Walker
# For teaching me how to code
 
# hint for those learning, modulo is the remainder operator
# if a number is divisible by 3, the remainder will be 0
# if a number is divisible by 5, the remainder will be 0
# if a number is divisible by 3 and 5, the remainder will be 0
# if a number is not divisible by 3 or 5, the remainder will be the number itself


def fizzbuzz(nums)
  if nums % 5 == 0 && nums % 3 == 0
    return "FizzBuzz"
  elsif nums % 3 == 0
    return "Fizz"
  elsif nums % 5 == 0
    return "Buzz"
  else
    return nums.to_s
  end
end