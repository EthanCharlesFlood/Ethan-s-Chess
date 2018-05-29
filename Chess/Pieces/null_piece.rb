require_relative "Piece"

class NullPiece < Piece
  # include Singleton

  def initialize
    @empty_positions = []
    initial_null_populator
  end

  def initial_null_populator
    (2..5).each do |row|
      (0..7).each do |pos|
        @empty_positions << [row,pos]
      end
    end
  end

  def empty?
    true
  end

  def symbol
    #I don't do anything.
  end

  def to_s
    " "
  end

  def moves
    # When a piece moves, it's current pos should be added to @empty_positions
    # When a piece moves, it's end_pos should be removed from @empty_positions
      # if it's not moving onto another piece.
  end

  # Maybe add a singleton module when we're smarter.


end
