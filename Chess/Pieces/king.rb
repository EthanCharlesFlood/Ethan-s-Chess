require_relative 'stepping_piece.rb'

class King < Piece
  include SteppingPiece

  def symbol
    :&
  end

  private

  def move_diffs
    [
      [1,0],
      [-1,0],
      [0,1],
      [0,-1],
      [1,1],
      [1,-1],
      [-1,1],
      [-1,-1]
    ]
  end

end
