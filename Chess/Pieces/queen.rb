require_relative 'sliding_piece.rb'

class Queen < Piece
  include SlidingPiece

  def symbol
    :Q
  end

  protected

  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

end
