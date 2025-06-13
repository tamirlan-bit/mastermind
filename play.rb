class Play

  attr_accessor :turn

  def initialize(board)
    @board = board
    @turn = 1
    puts "Welcome to ~ MasterMind Game ~\n"
    puts "turn is #{turn}"
  end

  def reset
    @turn = 0
  end

  def balls_selection
    puts "Please select the balls by entering its number"
    puts "You have ##{13-@turn} turns to crack the code" 
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
    @excat_arr = []
    @board.balls.each_with_index do | ball, i |
      if @board.balls[i] == @board.code[i]
        @excat_arr << ball
        @board.exact[@turn] += 1
      end
    end
    #puts "@excat_arr: ",@board.@excat_arr
  end
     
  def misplaced_match
    @board.balls.each_with_index do | ball, i |
      if @board.code.include?(@board.balls[i])  && @board.balls[i] != @board.code[i] && !@excat_arr.include?(@board.balls[i]) 
        @board.misplaced[@turn] += 1
      end
    end
  end

  def win?
    if @board.exact[@turn] == 4
      puts "Code was cracked, only took you ##{@turn} turns, good Job!\n\n"            
      @board.replay(self)
    elsif @turn == 12 && @board.exact[@turn] < 4
      puts "Attempts over!"
      @board.replay(self)
    end    
  end


end
