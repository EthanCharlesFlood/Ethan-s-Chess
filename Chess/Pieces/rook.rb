require_relative 'sliding_piece.rb'

class Rook < Piece
  include SlidingPiece

  def symbol
    :R
  end

  protected

  def move_dirs
    HORIZONTAL_DIRS
  end

end
