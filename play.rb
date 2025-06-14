class Play

  attr_accessor :turn

  def initialize(board)
    @board = board
    @turn = 1
    puts "~~~ Welcome to MasterMind Game ~~~   \n\n"
    puts "Please select the balls by entering its number"
  end

  def reset
    @turn = 0 # Start at 0 so first play is counted as Turn 1 after loop increments
  end

  def balls_selection
    puts "You have ##{13-@turn} turns to crack the code\n" 
    # puts "Code is: ",@board.code
    @board.balls = []
    while @board.balls.size < 4
      print "Enter ball ##{@board.balls.size + 1}: "
      input = gets.chomp.to_i
      if input.between?(1, 6)
        @board.balls << @board.send("ball#{input}")
      else
        puts "That's not a valid number. Try again."
      end
    end
    @board.b[@turn] = @board.balls
  end

  def exact_match
    @exact_arr = []
    @board.balls.each_with_index do | ball, i |
      if @board.balls[i] == @board.code[i]
        @exact_arr << ball
        @board.exact[@turn] += 1
      end
    end
  end
     
  def misplaced_match
    @board.balls.each_with_index do | ball, i |
      if @board.code.include?(@board.balls[i])  && @board.balls[i] != @board.code[i] && !@exact_arr.include?(@board.balls[i]) 
        @board.misplaced[@turn] += 1
      end
    end
  end

  def win?
    @board.exact[@turn] == 4
  end

end
