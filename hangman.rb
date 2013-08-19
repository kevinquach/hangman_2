#!/usr/bin/env ruby

puts "Program goes here..."


puts "Welcome to Hangman!"

word = ["rhythm"].sample
chances = 8

length = word.length

word_container = Array.new(length, "_")

while chances > 0
case word
when "rhythm"
  puts "Guess a single letter (a-z) or the entire word: "
  guess = gets.chomp
  if guess.include?('r')
    word_container[0] = 'r'
    puts "Word: #{word_container.join}"
    chances = chances - 1
    puts "You have #{chances} chances left."
  elsif guess.include?('h')
    word_container[1] = 'h'
    word_container[4] = 'h'
    puts "Word: #{word_container}"
    chances = chances - 1
    puts "You have #{chances} chances left."
  elsif guess.include?('y')
    word_container[2] = 'y'
    puts "Word: #{word_container}"
    chances = chances - 1
    puts "You have #{chances} chances left."
  elsif guess.include?('t')
    word_container[3] = 't'
    puts "Word: #{word_container}"
    chances = chances - 1
    puts "You have #{chances} chances left."
  elsif guess.include?('m')
    word_container[5] = 'm'
    puts "Word: #{word_container}"
    chances = chances - 1
    puts "You have #{chances} chances left."
  else
    puts "Sorry, no #{guess} found."
    chances = chances - 1
    puts "You have #{chances} chances left."
  end
end
end

if chances == 0
  puts "You have #{chances} left."
  puts "You're out of chances, better luck next time..."
end


if word_container.join == word.join
  puts "You are correct. You win!"
end

