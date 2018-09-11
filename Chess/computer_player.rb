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
    pieces.each { |piece| moves += piece.moves }
    moves
  end

end
