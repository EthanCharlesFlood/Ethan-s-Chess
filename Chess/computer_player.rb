require_relative "player.rb"

class ComputerPlayer < Player

  # inherits a color and a display in initialize from payer class
  def make_move

  end

  def pieces
    @display.board.pieces.select { |piece| piece.color == @color }
  end

  def moves
    moves = []
    pieces.each do |piece|
      piece.moves.each do |move|
        moves << [piece.pos, move]
      end
    end
    moves
  end

  # very naive implementation of computer player
  def easy_ai_make_move
    moves.sample
  end

end
