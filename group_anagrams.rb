# Leetcode link: https://leetcode.com/problems/group-anagrams/
# Problem: Given an array of strings, group anagrams together.
# Example:
# Input: ["eat", "tea", "tan", "ate", "nat", "bat"]
# Output:
# [
#  ["ate","eat","tea"],
#  ["nat","tan"],
#  ["bat"]
#  ]
#  Note:
#  All inputs will be in lowercase.
#  The order of your output does not matter.
#  Solution:

def group_anagrams(strs)
    map = Hash.new
    for i in 0..strs.length - 1
        sorted = strs[i].chars.sort.join
        if map.key?(sorted)
            map[sorted] = [strs[i], *map[sorted]]
        else
            map[sorted] = [strs[i]]
        end
    end 
    map.values
end

# far faster solution both in runtime and memory usage

def group_anagrams(strs)
  #we need to create a hash map to store the sorted strings
  grouped = {}
  strs.each do |w|
    # sort the characters of the word in the array and join them
    sorted = w.chars.sort.join
    # if the sorted word is already in the hash map, add the word to the array
    # essentially we're going to sort the words alphabetically and group them together if they are the same
    # so eat would become aet and tea would become aet and we would group them together
    # we would then return the values of the hash map
    if grouped.key?(sorted)
      # we check if the key is the same as the sorted word
      # if it is we add the word to the array
      # the << operator is used to add the word to the array
      grouped[sorted] << w
    else 
        # if the key is not the same as the sorted word, we create a new key
        grouped[sorted] = [w]
    end
  end
  grouped.values
end