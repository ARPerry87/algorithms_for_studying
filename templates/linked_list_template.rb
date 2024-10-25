# This will serve as a template for solving algorithms with linked lists

def solution(head)
  result = [] # initialize an empty array to hold the result
  traverse_linked_list(head, result) # start the traversal
  result # return the final result
end

def traverse_linked_list(node, result)
  return if node.nil? # base case: if the node is nil, return

  result << node.value # process the current node
  traverse_linked_list(node.next, result) # recursively traverse the next node
end