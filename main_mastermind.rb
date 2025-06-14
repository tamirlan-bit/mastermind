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
  board.clear_screen
  board.display
  if play.win?
    puts "You cracked the code in #{play.turn} turns!"
    board.replay(play)
  elsif play.turn == 12
      puts "Attempts over!"
      puts "Code was :",board.code
      board.replay(play)
  end
  play.turn +=1
end
