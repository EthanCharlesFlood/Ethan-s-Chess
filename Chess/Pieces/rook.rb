require_relative 'sliding_piece.rb'

class Rook < Piece
  include SlidingPiece

  def symbol
    :R
  end

  def to_s
    if self.color == :white
      "\u{2656}"
    elsif self.color == :black
      "\u{265C}"
    end
  end

  protected

  def move_dirs
    HORIZONTAL_DIRS
  end

end
