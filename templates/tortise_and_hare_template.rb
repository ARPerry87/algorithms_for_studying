# This is to serve as a template for using the Tortise and Hare algorithm 
# This algorithm is used to detect cycles in a linked list

def solution(head)
  tortoise = head
  hare = head

  while hare != nil && hare.next != nil
    tortoise = tortoise.next
    hare = hare.next.next

    if tortoise == hare
      return true # cycle detected
    end
  end

  false # no cycle detected
end