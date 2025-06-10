    # Print empty Board
    # puts <<~Board

    #   ~~~ MasterMind Game ~~~
    #   _____________________________
    #   |EXACT_____________MISPLACED|
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||   
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||   
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||_0_||#{emp}|#{emp}|#{emp}|#{emp}||_0_||
    #   ||=========================||
    #   ||=== Choose The Balls ====||
    #   ||===#{grn}#{cyn}#{ylw}#{red}#{mgt}#{blu}====||
    #   ||=========================||
    #   =============================

    # Board

require 'pp'

class Board
  require 'colorize'

  def initialize
  end

  attr_accessor :emp

  def display
    grn = "(O)".white.on_light_green
    cyn = "(O)".white.on_light_cyan
    ylw = "(O)".white.on_light_yellow
    red = "(O)".white.on_light_red
    mgt = "(O)".white.on_light_magenta
    blu = "(O)".white.on_light_blue
    emp = "(_)"
    
    b = {
      1 => [emp, emp, emp, emp], 
      2 => [emp, emp, emp, emp],
      3 => [emp, emp, emp, emp],
      4 => [emp, emp, emp, emp],
      5 => [emp, emp, emp, emp],
      6 => [emp, emp, emp, emp],
      7 => [emp, emp, emp, emp],
      8 => [emp, emp, emp, emp],
      9 => [emp, emp, emp, emp],
      10 => [emp, emp, emp, emp],
      11 => [emp, emp, emp, emp],
      12 => [emp, emp, emp, emp],
      13 => [blu, red, mgt, ylw]
    }
    
    # print connected board
    puts <<~Board

    ~~~ MasterMind Game ~~~
    _____________________________
    |EXACT_____________MISPLACED|
    ||_0_||#{b[13][0]}|#{b[13][1]}|#{b[13][2]}|#{b[13][3]}||_0_||   
    ||_0_||#{b[12][0]}|#{b[12][1]}|#{b[12][2]}|#{b[12][3]}||_0_||
    ||_0_||#{b[11][0]}|#{b[11][1]}|#{b[11][2]}|#{b[11][3]}||_0_||
    ||_0_||#{b[10][0]}|#{b[10][1]}|#{b[10][2]}|#{b[10][3]}||_0_||
    ||_0_||#{b[9][0]}|#{b[9][1]}|#{b[9][2]}|#{b[9][3]}||_0_||
    ||_0_||#{b[8][0]}|#{b[8][1]}|#{b[8][2]}|#{b[8][3]}||_0_||
    ||_0_||#{b[7][0]}|#{b[7][1]}|#{b[7][2]}|#{b[7][3]}||_0_||
    ||_0_||#{b[6][0]}|#{b[6][1]}|#{b[6][2]}|#{b[6][3]}||_0_||
    ||_0_||#{b[5][0]}|#{b[5][1]}|#{b[5][2]}|#{b[5][3]}||_0_||   
    ||_0_||#{b[4][0]}|#{b[4][1]}|#{b[4][2]}|#{b[4][3]}||_0_||
    ||_0_||#{b[3][0]}|#{b[3][1]}|#{b[3][2]}|#{b[3][3]}||_0_||
    ||_0_||#{b[2][0]}|#{b[2][1]}|#{b[2][2]}|#{b[2][3]}||_0_||
    ||_0_||#{b[1][0]}|#{b[1][1]}|#{b[1][2]}|#{b[1][3]}||_0_||
    ||=========================||
    ||=== Choose The Balls ====||
    ||===#{grn}#{cyn}#{ylw}#{red}#{mgt}#{blu}====||
    ||=========================||
    =============================

    Board

    

  end
end

# Call on an instance
Board.new.display


# instructions:
# 1 - print empty board - done
# 2 - print board with balls - done
# 3 - print board made of hash b[][] -done
# 4
# 5