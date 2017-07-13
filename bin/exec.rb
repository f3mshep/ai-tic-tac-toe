require_relative '../lib/game.rb'
require 'pry'

puts "Welcome to Tic-Tac-Toe"
puts "Do you want to play against AI?"
input = gets.chomp.downcase

if input ==  "yes"
  game = Board.new
  game.play_ai
else
  game = Board.new
  game.play
end
