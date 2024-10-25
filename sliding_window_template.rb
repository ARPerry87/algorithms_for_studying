def find_substring(s)
  map = Array.new(128, 0) # Initialize a frequency map for characters
  counter = 0 # Count of unique characters
  begin_index = 0 # Start index of the current substring
  end_index = 0 # End index of the current substring
  d = 0 # Length of the longest substring

  s.each_char.with_index do |char, index| # Iterate through the string
    map[char.ord] += 1 # Increment the frequency of the current character
    counter += 1 if map[char.ord] > 0 # Increment counter if it's a new character

    while counter == s.length # While all characters are present
      d = [d, end_index - begin_index + 1].max # Update the length of the longest substring
      map[s[begin_index].ord] -= 1 # Decrement the frequency of the character at the start index
      counter -= 1 if map[s[begin_index].ord] >= 0 # Decrement counter if the character count is non-negative
      begin_index += 1 # Move the start index forward
    end

    end_index += 1 # Move the end index forward
  end

  d # Return the length of the longest substring
end