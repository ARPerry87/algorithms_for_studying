# Leetcode https://leetcode.com/problems/word-search-ii/
# Given an m x n board of characters and a list of strings words, return all words on the board.

# Each word must be constructed from letters of sequentially adjacent cells, 
# where adjacent cells are horizontally or vertically neighboring. 
# The same letter cell may not be used more than once in a word.
 
# Example 1:
# Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], words = ["oath","pea","eat","rain"]
# Words = ["oath","pea","eat","rain"]
# Output: ["eat","oath"]

# Example 2:
# Input: board = [["a","b"],["c","d"]], words = ["abcb"]
# Output: []
# Constraints:
# m == board.length
# n == board[i].length
# 1 <= m, n <= 12
# board[i][j] is a lowercase English letter.
# 1 <= words.length <= 3 * 10^4
# 1 <= words[i].length <= 10
# words[i] consists of lowercase English letters.
# All the strings of words are unique.

# Plan:
# 1. Create a Trie data structure to store the words

# @param {Character[][]} board
# @param {String[]} words
# @return {String[]}

class TrieNode
  attr_accessor :val, :children, :parent, :is_word
  def initialize(val = '*', parent = nil)
    @val = val
    @children = {}
    @parent = parent
    @is_word = false
  end
end

class Trie
  attr_accessor :root
  def initialize
    @root = TrieNode.new
  end

  def insert(words)
    insert = ->(word) do
      current = root
      word.chars.each do |c|
        current.children[c] ||= TrieNode.new(val = c, current)
        current = current.children[c]
      end
      current.is_word = true
    end

    words.each { |word| insert.call(word) }
  end

  def delete(node)
    node.is_word = false

    child = node
    parent = child.parent
    while parent && child.children.empty?
      parent.children.delete(child.val)
      child = parent
      parent = parent.parent
    end
  end
end

def find_words(board, words)
  results = []

  trie = Trie.new
  visited = Set.new

  rows = board.length - 1
  columns = board[0].length - 1

  dfs = ->(row, column, node, word) do
    return unless row.between?(0, rows) && column.between?(0, columns)
    return if visited.include?([row, column])

    node = node.children[board[row][column]]
    return if node.nil?

    word += board[row][column]
    if node.is_word
      results.push(word)
      trie.delete(node)
    end

    visited.add([row, column])
    [[-1,0],[1,0],[0,-1],[0,1]].each do |x, y|
      dfs.call(row + x, column + y, node, word)
    end
    visited.delete([row, column])

    return
  end

  # Some of the last test cases resulted in TLEs which appears to be due to ruby being too slow.
  # As an optimization, rather than search for long words with repeated prefixes ("aaaaaaaaqp") reverse these words ("pqaaaaaaaa").
  should_reverse_words = ->(words) do
    if words && words.length > 100
      sample_word = words[10...-10].sample
      most_repeated_letter = sample_word.chars.tally.max_by { |_k, v| v }
      if sample_word.index(most_repeated_letter[0]).zero?
        return true
      end
    end
    false
  end

  reverse = should_reverse_words.call(words)

  trie.insert(reverse ? words.map(&:reverse) : words)

  (0..rows).each do |row|
    (0..columns).each do |column|
      dfs.call(row, column, trie.root, '')
    end
  end

  reverse ? results.map(&:reverse) : results
end

# my gods this was difficult, I had to end up looking up the solution to this problem.
# Note to self: I need to practice more questions like this one.