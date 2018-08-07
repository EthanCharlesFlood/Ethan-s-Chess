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
    false
  end

  def valid_moves
    raise NotImplementedError
  end

  def pos=(val)
    @pos = val
  end

  def symbol
    :P
  end

  def to_s
    symbol.to_s
  end

  def valid_move?(pos)
    if !@board.valid_pos?(pos)
      return false
    elsif pos[0] < 0
      return false
    elsif pos[1] < 0
      return false
    elsif pos[0] > 7
      return false
    elsif pos[1] > 7
      return false
    elsif !@board[pos].empty?
      return false
    end
    true
  end

  private

  def move_into_check?(end_pos)
    d_board = @board.dup
    d_board.move_piece(@pos, end_pos)
    d_board.in_check?(@color)
  end
end
