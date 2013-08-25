#!/usr/bin/env ruby

puts "Welcome to Hangman!"

word = ["rhythm", "ebb"].sample
chances = 8

length = word.length

word_container = Array.new(length, "_")

def output
  puts "Word: #{word_container.join}"
  puts "You have #{chances} chances left."
end

def prompt(word_container)
  puts "Word: #{word_container.join}"
  puts "Guess a single letter (a-z) or the entire word: "
end


# initialize the word
# greet the user

# until the game is over:
  # print game state
  # get user input
  # check input logic
    # if input > 1 then input is a word
      # if input == hidden_word
        # print user win message
        # end game
      # else user loses
        # print user lose message
        # end game
    # else input is a letter
      # if input has already been guessed
        # print message
      # elsif input is included in hidden_word
        # print number of occurences
        # reveal hidden letter
        # save letter as guessed
      # else input is not included in hidden_word
        # print message
        # decremate from chances
        # if chances < 0
          # print message
          # game ends










while chances > 0
case word
when "rhythm"
  prompt(word_container)
  guess = gets.chomp
  if guess == word
    puts "Congratulations, you've guessed the word!"
    break
  elsif guess.include?('r')
    word_container[0] = 'r'
    output
  elsif guess.include?('h')
    word_container[1] = 'h'
    word_container[4] = 'h'
    output
  elsif guess.include?('y')
    word_container[2] = 'y'
    output
  elsif guess.include?('t')
    word_container[3] = 't'
    output
  elsif guess.include?('m')
    word_container[5] = 'm'
    output
  else
    puts "Sorry, no '#{guess}' found."
    chances = chances - 1
    puts "You have #{chances} chances left."
  end

when "ebb"
  prompt(word_container)
  guess = gets.chomp
  if guess == word
    puts "Congratulations, you've guessed the word!"
    break
  elsif guess.include?('e')
    word_container[0] = 'e'
    chances = chances - 1
    output
  elsif guess.include?('b')
    word_container[1] = 'b'
    word_container[2] = 'b'
    chances = chances - 1
    output
  else
    puts "Sorry, no '#{guess}' found."
    chances = chances - 1
    puts "You have #{chances} chances left."
end
end
end

if chances == 0
  puts "You have #{chances} left."
  puts "You're out of chances, better luck next time..."
end


