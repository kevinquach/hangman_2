WORDS = %w(orange tomato)


  @player_container = []
  @word_container = []
  @current_guess = nil
  @chances = 8
  # Ask for a guess from user
  # Choose random word
  @random_word = WORDS.sample


# Get length of random word and create array of underscores

@hidden = Array.new(@random_word.length, '_').join

puts "Word: #{@hidden}"
puts "\nRandom word: #{@random_word}\n"

# random_word.split(//).each do |letter|
#   @word_container << letter
# end

# print @word_container
def check_for_a_word(word)
  if @random_word == word
    puts "Nice, #{word} is correct! You win!"
    exit
  else
    check_letter(word)
  end
end

def check_chances
  if @chances == 0
    puts "No chances left. Game Over!"
    exit
  else
    guess
  end
end

def index(letter)
  index_num = @random_word.index(letter)
  @hidden[index_num] = letter
  print @hidden
end

def check_letter(letter)
  if @random_word.include?(letter)
    puts "You guessed #{letter} and it's one of the letters!"
    puts "Found #{@random_word.count(letter)} occurances(s) of the character '#{letter}'"
    index(letter)
    guess
  else
    puts "You guessed wrong!"
    @chances -= 1
    check_chances
  end
end

def guess
  puts "\nGuess a single letter (a-z) or the entire word: "
  puts "Chances remaining: #{@chances}"
  input = gets.chomp
  @current_guess = input
  @player_container << input
  check_for_a_word(input)
end




guess





