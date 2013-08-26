WORDS = %w(orange)

  @word = WORDS.sample
  @hidden_letters = Array.new(@word.length, '_').join
  @letters_already_guessed = []
  @counter = 0
  @chances = 8
  @current_guess = nil

puts "\nRandom word: #{@word}\n"

def check_for_the_word
  if @word == @current_guess
    puts "Nice, '#{@current_guess}' is correct! You win!"
    exit
  else
    wrong_guess
  end
end

def check_chances
  if @chances == 0
    puts "\nNo chances left. Game over...Better luck next time!"
    exit
  else
    prompt
  end
end

def check_solved
  if @hidden_letters == @word
    puts "The word is indeed '#{@word}'.\n\nYou got all the letters! Good job!"
    exit
  else
    prompt
  end
end

def wrong_guess
  puts "Sorry, that isn't correct. Keep trying!"
  @chances -= 1
  check_chances
end

def reveal_letter

  index_num = @word.index(@current_guess)
  @hidden_letters[index_num] = @current_guess
  check_solved
end

def correct_guess

  @letters_already_guessed << @current_guess
  puts "You guessed '#{@current_guess}' and we found #{@word.count(@current_guess)} occurences(s) of the letter\n\n"
  reveal_letter
end

def letter_already_guessed?
  if @letters_already_guessed.include?(@current_guess)
    puts "You already guessed '#{@current_guess}'. Pick another!"
    prompt
  else
    correct_guess
  end
end

def check_letter
  @word.include?(@current_guess) ? letter_already_guessed? : wrong_guess
end

def guess
  @current_guess = gets.chomp.downcase.strip
  if (/\S/).match(@current_guess) && @current_guess.size == 1
    check_letter
  elsif @current_guess.size > 1
    check_for_the_word
  else
    prompt
  end
end

def prompt
  puts "Word: #{@hidden_letters}\nChances remaining: #{@chances}\nGuess a single letter (a-z) or the entire word: "
  guess
end

prompt
