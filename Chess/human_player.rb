require_relative "player.rb"

class HumanPlayer < Player
  def make_move(board)
    start_pos, end_pos = nil, nil

    until start_pos && end_pos
      @display.render

      if start_pos
        puts "#{@color.to_s}'s turn. To where would you like to move?"
        end_pos = @display.cursor.get_input
        display.reset! if end_pos
      else
        puts "#{@color.to_s}'s turn. From where would you like to move?"
        start_pos = @display.cursor.get_input
        display.reset! if start_pos
      end
    end
  [start_pos, end_pos]
  end
end
