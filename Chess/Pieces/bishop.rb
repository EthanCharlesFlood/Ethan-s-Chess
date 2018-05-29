require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece

  def symbol
    :B
  end

  protected

  def move_dirs
    DIAGONAL_DIRS
  end

end
