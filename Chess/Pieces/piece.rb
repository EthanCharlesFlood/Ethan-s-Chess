class Piece
  # PIECES = :P. :B, :K, :R, :Q, :*

COLORS = [:white, :black]

attr_reader :pos, :color, :board
  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end

  def empty?
    # maybe this is duck typing, taking a boolean for whether a position is null_piece or not?
    false
  end

  def valid_moves
    # we will define this on our children to return an array of where they can move
    raise NotImplementedError
  end

  def pos=(val)
    # this is possible a bracket method?
    @pos = val
  end

  def symbol
    # we add this to all children and make them have unique symbols
    :P
  end

  def to_s
    # for display purposes
    symbol.to_s
  end

  def valid_move?(pos)
    if @board.valid_pos?(pos) == false
      return false
    elsif @board[pos].empty? == false
      return false
    elsif pos[0] < 0
      return false
    elsif pos[1] < 0
      return false
    end
    true
  end

  private

  def move_into_check?(end_pos)
    # kind of complicated
    # determines if a move will put a king in check?  (maybe your king, maybe theirs?)
  end
end
