class Board
  attr_accessor :b, :balls, :exact, :misplaced
  attr_reader :ball1, :ball2, :ball3, :ball4, :ball5, :ball6, :code

  def initialize
    @ball1 = "(1)".black.on_light_green
    @ball2 = "(2)".black.on_light_cyan
    @ball3 = "(3)".black.on_light_yellow
    @ball4 = "(4)".black.on_light_red
    @ball5 = "(5)".black.on_light_magenta
    @ball6 = "(6)".black.on_light_blue
    @emp = "(_)"
    reset
    display
  end
  
  def reset
    @code = [@ball1, @ball2, @ball3, @ball4, @ball5, @ball6].sample(4)
    @exact = Array.new(13).fill(0)
    @misplaced = Array.new(13).fill(0)
    empty_row = Array.new(4, @emp)
    @b = {}
    (1..13).each { |i| @b[i] = empty_row.dup }
  end

  def display
    # puts @code 
    puts <<~Board
    _____________________________
    |EXACT_____________MISPLACED|
    ||_#{@exact[12]}_||#{@b[12][0]}|#{@b[12][1]}|#{@b[12][2]}|#{@b[12][3]}||_#{@misplaced[12]}_||
    ||_#{@exact[11]}_||#{@b[11][0]}|#{@b[11][1]}|#{@b[11][2]}|#{@b[11][3]}||_#{@misplaced[11]}_||
    ||_#{@exact[10]}_||#{@b[10][0]}|#{@b[10][1]}|#{@b[10][2]}|#{@b[10][3]}||_#{@misplaced[10]}_||
    ||_#{@exact[9]}_||#{@b[9][0]}|#{@b[9][1]}|#{@b[9][2]}|#{@b[9][3]}||_#{@misplaced[9]}_||
    ||_#{@exact[8]}_||#{@b[8][0]}|#{@b[8][1]}|#{@b[8][2]}|#{@b[8][3]}||_#{@misplaced[8]}_||
    ||_#{@exact[7]}_||#{@b[7][0]}|#{@b[7][1]}|#{@b[7][2]}|#{@b[7][3]}||_#{@misplaced[7]}_||
    ||_#{@exact[6]}_||#{@b[6][0]}|#{@b[6][1]}|#{@b[6][2]}|#{@b[6][3]}||_#{@misplaced[6]}_||
    ||_#{@exact[5]}_||#{@b[5][0]}|#{@b[5][1]}|#{@b[5][2]}|#{@b[5][3]}||_#{@misplaced[5]}_||
    ||_#{@exact[4]}_||#{@b[4][0]}|#{@b[4][1]}|#{@b[4][2]}|#{@b[4][3]}||_#{@misplaced[4]}_||
    ||_#{@exact[3]}_||#{@b[3][0]}|#{@b[3][1]}|#{@b[3][2]}|#{@b[3][3]}||_#{@misplaced[3]}_||
    ||_#{@exact[2]}_||#{@b[2][0]}|#{@b[2][1]}|#{@b[2][2]}|#{@b[2][3]}||_#{@misplaced[2]}_||
    ||_#{@exact[1]}_||#{@b[1][0]}|#{@b[1][1]}|#{@b[1][2]}|#{@b[1][3]}||_#{@misplaced[1]}_||
    ||=========================||
    ||==== Available Balls ====||
    ||===#{@ball1}#{@ball2}#{@ball3}#{@ball4}#{@ball5}#{@ball6}====||
    ||=========================||
    =============================
    
    Board
  end

  def replay(play)
    puts "\n\nWould you like Another Game?\nPress 'Y' for Yes and 'N' for No"
    re = gets.chomp.downcase
    if re == 'y' || re =='yes' 
      clear_screen
      reset
      play.reset
      display
    else
      puts "\nBey!!! (ノಠ益ಠ)ノ彡┻━┻\n\n"
      exit
    end
  end

  def clear_screen
    system("clear") || system("cls")
  end

end

