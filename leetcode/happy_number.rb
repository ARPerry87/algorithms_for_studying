# @param {Integer} n
# @return {Boolean}

def is_happy(n)
  process = n.digits.sum { |digit| digit ** 2 }

  return true if process == 1
  return false if process ==4
  is_happy(process)
end

#faster solution
#
def is_happy(n)
  process = n.digits.map { |digit| digit ** 2 }.sum

  return true if process == 1
  return false if process ==4
  is_happy(process)
end