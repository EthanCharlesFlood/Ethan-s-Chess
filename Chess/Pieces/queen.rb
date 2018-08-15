require_relative 'sliding_piece.rb'

class Queen < Piece
  include SlidingPiece

  def symbol
    :Q
  end

  def to_s
    if self.color == :white
      "\u{2655}"
    elsif self.color == :black
      "\u{265B}"
    end
  end

  protected

  def move_dirs
    HORIZONTAL_DIRS + DIAGONAL_DIRS
  end

end
