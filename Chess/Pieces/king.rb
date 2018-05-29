require_relative 'stepping_piece.rb'

class King < Piece
  include SteppingPiece

  def symbol
    :&
  end

end

MOVES = [
  [1,0],
  [-1,0],
  [0,1],
  [0,-1],
  [1,1],
  [1,-1],
  [-1,1],
  [-1,-1]
]
