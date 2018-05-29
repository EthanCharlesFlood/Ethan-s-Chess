require_relative 'sliding_piece.rb'

class Rook < Piece
  include SlidingPiece

  def symbol
    :R
  end

  protected

  def move_dirs
    # Our module will provide possible horizontal positions
    HORIZONTAL_DIRS
  end

end
