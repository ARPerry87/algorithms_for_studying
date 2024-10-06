# Leetcode link: https://leetcode.com/problems/add-two-numbers/
# Problem: You are given two non-empty linked lists representing two non-negative integers. 
# The digits are stored in reverse order, and each of their nodes contains a single digit. 
# Add the two numbers and return the sum as a linked list.
# You may assume the two numbers do not contain any leading zero, except the number 0 itself.
# Example:
# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explanation: 342 + 465 = 807.
 
# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}


# Solution:
def add_two_numbers(l1, l2)
  head = ListNode.new
  current = head
  carry = 0

  while l1 || l2 || carry != 0
    l1_val = l1 ? l1.val : 0
    l2_val = l2 ? l2.val : 0
    sum = l1_val + l2_val + carry
    current.next = ListNode.new(sum % 10)
    carry = total / 10

    # move list pointers foward
    l1 = l1 ? l1.next : nil
    l2 = l2 ? l2.next : nil
    current = current.next
  end
  head.next
end

# more efficient solution memory wise
def add_two_numbers(l1, l2)
  head = ListNode.new
  current = head
  carry = 0

  while l1 || l2 || carry != 0
    l1_val = l1&.val || 0
    l2_val = l2&.val || 0
    sum = l1_val + l2_val + carry
    carry, digit = sum.divmod(10)
    current.next = ListNode.new(digit)

    # move list pointers forward
    l1 = l1&.next
    l2 = l2&.next
    current = current.next
  end
  head.next
end