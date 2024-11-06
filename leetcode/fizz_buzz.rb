# Leetcode link: https://leetcode.com/problems/fizz-buzz/
# Description: Given an integer n, return a string array answer (1-indexed) where:
 
# answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
# answer[i] == "Fizz" if i is divisible by 3.
# answer[i] == "Buzz" if i is divisible by 5.
# answer[i] == i if non of the above conditions are true.

def fizz_buzz(n)
  result = []
  (1..n).each do |num|
    if number % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 3 == 0
      result << "Fizz"
    elsif num % 5 == 0
      result << "Buzz"
    else
      result << num.to_s
    end
  end
  result
end