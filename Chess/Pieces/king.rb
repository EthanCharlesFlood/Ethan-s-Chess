require_relative 'stepping_piece.rb'

class King < Piece
  include SteppingPiece

  def symbol
    :&
  end

  protected

  def move_dirs

  end

end
