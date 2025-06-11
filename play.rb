class Play

  attr_accessor :b

  def initialize(board)
    @board = board
    #puts "Player Make Your selection!\n"
  end

  def replay
    puts "Would you like Another Game?\nPress 'Y' for Yes and 'N' for No"
    re = gets.chomp.downcase
    if re == 'y' || re =='yes'      
      @board.reset
      @board.display
    else
      puts "\nwell ok (ノಠ益ಠ)ノ彡┻━┻\n\n"
      exit
    end
  end

  # def player_selct
  #   #ball1 = gets.chomp.to_i
  #   @b[1][0] = grn
  # end

end
