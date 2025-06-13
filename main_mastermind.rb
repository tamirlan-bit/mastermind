require 'pp'
require 'colorize'
require_relative 'board'
require_relative 'play'


board = Board.new
play = Play.new(board)
until board.turn > 12 || board.win?
  board.balls_selection      
  board.exact_match
  board.misplaced_match
  board.display
  board.win?      
  board.turn +=1
end
