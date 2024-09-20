# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}

def reverse_ll(head)
  temp = nil
  until head.nil?
    temp = ListNode.new(head.val, temp)
    head = head.next
  end
  temp
end

def reverse_list(head)
  reverse_ll(head)
end