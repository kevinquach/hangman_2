WORDS = %w(orange tomato corn)

@player_container = []
@word_container = []
@current_guess = nil
# Ask for a guess from user
# Choose random word
@random_word = WORDS.sample

# Get length of random word and create array of underscores

hidden = Array.new(@random_word.length, '_').join

puts "Word: #{hidden}"
puts "\nRandom word: #{@random_word}\n"

# random_word.split(//).each do |letter|
#   @word_container << letter
# end

# print @word_container

def guess
  puts "\nGuess a signle letter (a-z) or the entire word: "
  input = gets.chomp
  @current_guess = input
  @player_container << input
  check_letter(@current_guess)
end

def check_letter(letter)
  if @random_word.include?(letter)

    puts "You guessed #{letter} and it's one of the letters!"
    puts "Found #{@random_word.count(letter)} occurances(s) of the character #{letter}"
    index(letter)
    guess
  else
    puts "You guessed wrong!"
    guess
  end
end


def index(letter)
  puts @random_word.index(letter)
end


guess





