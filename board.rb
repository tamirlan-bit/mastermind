class Board
  attr_accessor :b
  attr_accessor :balls
  attr_accessor :turn

  def initialize
    @ball1 = "(1)".black.on_light_green
    @ball2 = "(2)".black.on_light_cyan
    @ball3 = "(3)".black.on_light_yellow
    @ball4 = "(4)".black.on_light_red
    @ball5 = "(5)".black.on_light_magenta
    @ball6 = "(6)".black.on_light_blue
    @emp = "(_)"
    @exact = Array.new(13).fill(0)
    @misplaced = Array.new(13).fill(0)
    @code = [@ball6, @ball4, @ball5, @ball3]
    @turn = 1
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
      12 => [@emp, @emp, @emp, @emp]      
    }
  end

  def display    
    puts <<~Board

      ~~~ MasterMind Game ~~~
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
    ||=== Choose The Balls ====||
    ||===#{@ball1}#{@ball2}#{@ball3}#{@ball4}#{@ball5}#{@ball6}====||
    ||=========================||
    =============================
    
    Board
  end
  
  def balls_selection
    puts "Please select the balls by entering its number"
    puts "You have ##{13-@turn} turns to crack the code" 
    # puts "Code is: ",@code
    @balls = []
    while @balls.size < 4
      print "Enter ball ##{@balls.size + 1}: "
      input = gets.chomp.to_i
      if input.between?(1, 6)
        @balls << instance_variable_get("@ball#{input}")
      else
        puts "That's not a valid number. Try again."
      end      
    end
    b[@turn] = @balls    
  end

  def exact_match
    @exact_arr = []
    @balls.each_with_index do | ball, i |
      if @balls[i] == @code[i]
        @exact_arr << ball
        @exact[@turn] += 1
      end
    end
    #puts "Exact_arr: ",@exact_arr
  end
     
  def misplaced_match
    @balls.each_with_index do | ball, i |
      if @code.include?(balls[i])  && @balls[i] != @code[i] && !@exact_arr.include?(@balls[i]) 
        @misplaced[@turn] += 1
      end
    end
  end

  def win?
    if @exact[@turn] == 4
      puts "Code was cracked, only took you ##{@turn} turns, good Job!\n\n"
      exit
    elsif @turn == 12 && @exact[@turn] < 4
      puts "Attempts over!"
      exit
    end    
  end

end

