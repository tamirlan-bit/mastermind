require 'pp'
require 'colorize'
require_relative 'board'
require_relative 'play'


board = Board.new
play = Play.new(board)
board.game
