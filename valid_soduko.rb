def is_valid_sudoku(board)
  res = []
  (0..8).each do |i|
    (0..8).each do |j|
      element = board[i][j]
      next if element == '.'
      if element != '.'
        res << [i, element]
        res << [element, j]
        res << [i/3, j/3, element]
      end
    end
  end
  res.size == res.uniq.size
end

# faster solution

def is_valid_sudoku(board)
  areas = Array.new(27, 0) # 9 + 9 +  9 = 27
  9.times do |i|
      9.times do |j|
          el = board[i][j]            
          next if el == ?.
          mask = 1 << (el.to_i - 1)
          col = j + 9 # cols are in (9..17), rows are in (0..8)
          box = 3 * (i / 3) + j / 3 + 18 # boxes are in (18..26)
          return false unless mask & (areas[i] | areas[col] | areas[box]) == 0
          areas[i] |= mask
          areas[col] |= mask
          areas[box] |= mask
      end
  end
  true
end