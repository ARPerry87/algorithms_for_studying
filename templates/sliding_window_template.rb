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

# or like this 

def sliding_window(s, k)
  # Initialize variables
  window_start = 0
  max_length = 0
  char_frequency = Hash.new(0) # Frequency map for characters in the current window

  # Iterate over the string with the window end
  s.each_char.with_index do |char, window_end|
    # Add the current character to the frequency map
    char_frequency[char] += 1

    # Shrink the window if it exceeds the allowed size or condition
    while char_frequency.size > k 
      left_char = s[window_start] # Get the left most character of the window
      char_frequency[left_char] -= 1 # Decrement the frequency of the left character
      char_frequency.delete(left_char) if char_frequency[left_char] == 0 # Remove the character if its frequency is zero
      window_start += 1 # Move the window start to the right
    end

    # Update the maximum length of the window
    max_length = [max_length, window_end - window_start + 1].max # find the max length by comparing the current max length and the window size
  end

  # Return the result (e.g., max_length, the longest substring, etc.)
  max_length
end