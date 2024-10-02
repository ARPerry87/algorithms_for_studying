def solution(a)
  #instead of using a.each_cons(2).each_with_index, we can use a.uniq.count
  #this is going to be typically faster than almost any algorithm I can write
  #as it's been optimized by the Ruby core team
  a.uniq.count
end

#it could also use tally method in conjunction with uniq or even reduce
#
def solution(a)
  a.tally.keys.uniq.count
end