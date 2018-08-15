require_relative 'stepping_piece.rb'

class King < Piece
  include SteppingPiece

  def symbol
    :&
  end

  def to_s
    if self.color == :white
      "\u{2654}"
    elsif self.color == :black
      "\u{265A}"
    end
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
