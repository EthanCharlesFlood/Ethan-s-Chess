require_relative 'stepping_piece.rb'

class Knight < Piece
  include SteppingPiece

  def symbol
    :K
  end

  def to_s
    if self.color == :white
      "\u{2658}"
    elsif self.color == :black
      "\u{265E}"
    end
  end

  private

  def move_diffs
    [
      [1,2],
      [1,-2],
      [2,1],
      [2,-1],
      [-1,2],
      [-1,-2],
      [-2,-1],
      [-2,1]
    ]
  end

end
