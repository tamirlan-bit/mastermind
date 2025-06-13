require 'pp'
require 'colorize'
require_relative 'board'
require_relative 'play'


board = Board.new
play = Play.new(board)
until play.turn > 12 || play.win?
  play.balls_selection      
  play.exact_match
  play.misplaced_match
  board.display
  play.win?      
  play.turn +=1
end
