WORDS = %w(orange)

  word = WORDS.sample
  hidden_letters = Array.new(word.length, '_').join
  @letters_already_guessed = []
  chances = 8
  current_guess = nil

puts "\nRandom word: #{word}\n"

def check_for_the_word(word_being_guessed, word, chances, hidden_letters)
  if word == word_being_guessed
    puts "Nice, '#{word_being_guessed}' is correct! You win!"
    exit
  else
    wrong_guess(hidden_letters, chances, word)
  end
end

def check_chances(hidden_letters, chances, word)
  if chances == 0
    puts "\nNo chances left. Game over...Better luck next time!"
    exit
  else
    prompt(hidden_letters, chances, word)
  end
end

def check_solved (word, hidden_letters, chances)
  if hidden_letters == word
    puts "The word is indeed '#{word}'.\n\nYou got all the letters! Good job!"
    exit
  else
    prompt(hidden_letters, chances, word)
  end
end

def wrong_guess(hidden_letters, chances, word)
  puts "Sorry, that isn't correct. Keep trying!"
  chances -= 1
  check_chances(hidden_letters, chances, word)
end

def reveal_letter(letter_being_revealed, word, hidden_letters, chances)
  index_num = word.index(letter_being_revealed)
  hidden_letters[index_num] = letter_being_revealed
  check_solved(word, hidden_letters, chances)
end

def correct_guess(correct_letter, word, hidden_letters, chances)
  @letters_already_guessed << correct_letter
  puts "You guessed '#{correct_letter}' and we found #{word.count(correct_letter)} occurences(s) of the letter\n\n"
  reveal_letter(correct_letter, word, hidden_letters, chances)
end

def letter_already_guessed?(letter_being_guessed, word, hidden_letters, chances)
  if @letters_already_guessed.include?(letter_being_guessed)
    puts "You already guessed '#{letter_being_guessed}'. Pick another!"
    prompt(hidden_letters, chances, word)
  else
    correct_guess(letter_being_guessed, word, hidden_letters, chances)
  end
end

def check_letter(letter_being_guessed, word, chances, hidden_letters)
  if word.include?(letter_being_guessed)
    letter_already_guessed?(letter_being_guessed, word, hidden_letters, chances)
  else
    wrong_guess(hidden_word, chances, word)
  end
end

def guess(current_guess, word, chances, hidden_letters)
  if (/\S/).match(current_guess) && current_guess.size == 1
    check_letter(current_guess, word, chances, hidden_letters)
  elsif current_guess.size > 1
    check_for_the_word(current_guess, word, chances, hidden_letters)
  else
    prompt(hidden_letters, chances, word)
  end
end

def prompt(hidden_letters, chances, word)
  puts "Word: #{hidden_letters}\nChances remaining: #{chances}\nGuess a single letter (a-z) or the entire word: "
  current_guess = gets.chomp.downcase.strip
  guess(current_guess, word, chances, hidden_letters)
end

prompt(hidden_letters, chances, word)

