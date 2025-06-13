class Play

  attr_accessor :turn

  def initialize(board)
    @board = board
    @code = [@board.ball6, @board.ball4, @board.ball5, @board.ball3]
    @turn = 1
    puts "Welcome to ~ MasterMind Game ~\n"
  end

  def balls_selection
    puts "Please select the balls by entering its number"
    puts "You have ##{13-@turn} turns to crack the code" 
    # puts "Code is: ",@code
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
    @excat_arr = []
    @board.balls.each_with_index do | ball, i |
      if @board.balls[i] == @code[i]
        @excat_arr << ball
        @board.exact[@turn] += 1
      end
    end
    #puts "@excat_arr: ",@board.@excat_arr
  end
     
  def misplaced_match
    @board.balls.each_with_index do | ball, i |
      if @code.include?(@board.balls[i])  && @board.balls[i] != @code[i] && !@excat_arr.include?(@board.balls[i]) 
        @board.misplaced[@turn] += 1
      end
    end
  end

  def win?
    if @board.exact[@turn] == 4
      puts "Code was cracked, only took you ##{@turn} turns, good Job!\n\n"
      exit
    elsif @turn == 12 && @board.exact[@turn] < 4
      puts "Attempts over!"
      exit
    end    
  end


end
