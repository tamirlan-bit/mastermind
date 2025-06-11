class Board
  attr_accessor :b

  def initialize
    @ball1 = "(1)".black.on_light_green
    @ball2 = "(2)".black.on_light_cyan
    @ball3 = "(3)".black.on_light_yellow
    @ball4 = "(4)".black.on_light_red
    @ball5 = "(5)".black.on_light_magenta
    @ball6 = "(6)".black.on_light_blue
    @emp = "(_)"
    @exact = 0
    @misplaced = 0

    puts "  Welcome Player!!  "
    reset
    display
  end

  def reset
    @b = {
      1 => [@emp, @emp, @emp, @emp], 
      2 => [@emp, @emp, @emp, @emp],
      3 => [@emp, @emp, @emp, @emp],
      4 => [@emp, @emp, @emp, @emp],
      5 => [@emp, @emp, @emp, @emp],
      6 => [@emp, @emp, @emp, @emp],
      7 => [@emp, @emp, @emp, @emp],
      8 => [@emp, @emp, @emp, @emp],
      9 => [@emp, @emp, @emp, @emp],
      10 => [@emp, @emp, @emp, @emp],
      11 => [@emp, @emp, @emp, @emp],
      12 => [@emp, @emp, @emp, @emp],
      13 => [@ball6, @ball4, @ball5, @ball3]
    }
  end

  def display    
    # print connected board
    puts <<~Board

      ~~~ MasterMind Game ~~~
    _____________________________
    |EXACT_____________MISPLACED|
    ||_#{@exact}_||#{@b[13][0]}|#{@b[13][1]}|#{@b[13][2]}|#{@b[13][3]}||_#{@misplaced}_||   
    ||_#{@exact}_||#{@b[12][0]}|#{@b[12][1]}|#{@b[12][2]}|#{@b[12][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[11][0]}|#{@b[11][1]}|#{@b[11][2]}|#{@b[11][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[10][0]}|#{@b[10][1]}|#{@b[10][2]}|#{@b[10][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[9][0]}|#{@b[9][1]}|#{@b[9][2]}|#{@b[9][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[8][0]}|#{@b[8][1]}|#{@b[8][2]}|#{@b[8][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[7][0]}|#{@b[7][1]}|#{@b[7][2]}|#{@b[7][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[6][0]}|#{@b[6][1]}|#{@b[6][2]}|#{@b[6][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[5][0]}|#{@b[5][1]}|#{@b[5][2]}|#{@b[5][3]}||_#{@misplaced}_||   
    ||_#{@exact}_||#{@b[4][0]}|#{@b[4][1]}|#{@b[4][2]}|#{@b[4][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[3][0]}|#{@b[3][1]}|#{@b[3][2]}|#{@b[3][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[2][0]}|#{@b[2][1]}|#{@b[2][2]}|#{@b[2][3]}||_#{@misplaced}_||
    ||_#{@exact}_||#{@b[1][0]}|#{@b[1][1]}|#{@b[1][2]}|#{@b[1][3]}||_#{@misplaced}_||
    ||=========================||
    ||=== Choose The Balls ====||
    ||===#{@ball1}#{@ball2}#{@ball3}#{@ball4}#{@ball5}#{@ball6}====||
    ||=========================||
    =============================

    Board
  end
  
  def player_selct
    puts "Please select the balls by pressing entering its numbers"
    balls = []
    p balls
    while balls.size < 4
      print "Enter ball ##{balls.size + 1}: "
      input = gets.chomp.to_i
      n = 0
      if input.between?(1, 6)
        balls << instance_variable_get("@ball#{input}")
        n +=1
      else
        puts "That’s not a valid number. Try again."
      end
    end
    b[1] = balls
    balls
  end   


end

