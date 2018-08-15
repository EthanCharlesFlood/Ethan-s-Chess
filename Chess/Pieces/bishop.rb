require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece

  def symbol
    :B
  end

  def to_s
    if self.color == :white
      "\u{2657}"
    elsif self.color == :black
      "\u{265D}"
    end
  end

  protected

  def move_dirs
    DIAGONAL_DIRS
  end

end
