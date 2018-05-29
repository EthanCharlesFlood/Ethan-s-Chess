require_relative 'stepping_piece.rb'

class Knight < Piece
  include SteppingPiece

  def symbol
    :K
  end


end

MOVES = [
  [1,2],
  [1,-2],
  [2,1],
  [2,-1],
  [-1,2],
  [-1,-2],
  [-2,-1],
  [-2,1]
]
