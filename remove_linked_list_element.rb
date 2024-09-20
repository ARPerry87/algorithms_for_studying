# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @param {Integer} val
# @return {ListNode}

def remove_element(prev, head, val)
  def helper(prev, head, val)
    return nil if !head
      if head.val == val
        prev.next = head.next
        return helper(prev, head.next, val)
      end

    helper(head, head.next, val)
    return head
  end
  helper(head, head, val)
end

##faster solution
#
def remove_element(head, val)
  return if head.nil?

  curr = head
  prev = head
  while !curr.nil?
    if curr.val == val
      if curr == head
        head = head.next
        curr = head
        prev = head
      else
        prev.next = curr.next
        curr = curr.next
      end
    else
      prev = curr
      curr = curr.next
    end
  end
  head
end