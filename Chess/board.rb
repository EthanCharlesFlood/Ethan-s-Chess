require_relative "pieces.rb"

# Phase I: Board
# Your Board class should hold a 2-dimensional array (an array of arrays). Each position in the board either holds a moving Piece or a NullPiece (NullPiece will inherit from Piece).
#
# You'll want to create an empty Piece class as a placeholder for now. Write code for #initialize so we can setup the board with instances of Piece in locations where a Queen/Rook/Knight/ etc. will start and nil where the NullPiece will start.
#
# The Board class should have a #move_piece(start_pos, end_pos) method. This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:
#
# there is no piece at start_pos or
# the piece cannot move to end_pos.
# Time to test! Open up pry and load 'board.rb'. Create an instance of Board and check out different positions with board[pos]. Do you get back Piece instances where you expect to? Test out Board#move_piece(start_pos, end_pos), does it raise an error when there is no piece at the start? Does it successfully update the Board?
#
# Once you get some of your pieces moving around the board, call over your TA for a code-review.

class Board
  def populate
    white_populate
    @grid[2..5].each { |row| row.map! { |pos| NullPiece.new }}
    black_populate
  end

  def initialize(color,board,pos)
    @color = color
    @board = board
    @pos = pos
  end

  def white_populate
    @grid[0,0] = Rook.new(:white, self, [0,0])
    @grid[0,1] = Knight.new(:white, self, [0,1])
    @grid[0,2] = Bishop.new(:white, self, [0,2])
    @grid[0,3] = Queen.new(:white, self, [0,3])
    @grid[0,4] = King.new(:white, self, [0,4])
    @grid[0,5] = Bishop.new(:white, self, [0,5])
    @grid[0,6] = Knight.new(:white, self, [0,6])
    @grid[0,7] = Rook.new(:white, self, [0,7])
    (0..7).each do |idx|
      @grid[1,idx] = Pawn.new(:white, self, [0,idx])
    end
    # @grid[[0,0]] = Rook.new(:white, self, [0,0])
    # @grid[[0,1]] = Knight.new(:white, self, [0,1])
    # @grid[[0,2]] = Bishop.new(:white, self, [0,2])
    # @grid[[0,3]] = Queen.new(:white, self, [0,3])
    # @grid[[0,4]] = King.new(:white, self, [0,4])
    # @grid[[0,5]] = Bishop.new(:white, self, [0,5])
    # @grid[[0,6]] = Knight.new(:white, self, [0,6])
    # @grid[[0,7]] = Rook.new(:white, self, [0,7])
    # (0..7).each do |idx|
    #   @grid[[1,idx]] = Pawn.new(:white, self, [0,idx])
    # end
  end

  def black_populate
    @grid[7,0] = Rook.new(:black, self, [7,0])
    @grid[7,1] = Knight.new(:black, self, [7,1])
    @grid[7,2] = Bishop.new(:black, self, [7,2])
    @grid[7,3] = King.new(:black, self, [7,3])
    @grid[7,4] = Queen.new(:black, self, [7,4])
    @grid[7,5] = Bishop.new(:black, self, [7,5])
    @grid[7,6] = Knight.new(:black, self, [7,6])
    @grid[7,7] = Rook.new(:black, self, [7,7])
    (0..7).each do |idx|
      @grid[6,idx] = Pawn.new(:black, self, [6,idx])
    end
    # @grid[[7,0]] = Rook.new(:black, self, [7,0])
    # @grid[[7,1]] = Knight.new(:black, self, [7,1])
    # @grid[[7,2]] = Bishop.new(:black, self, [7,2])
    # @grid[[7,3]] = King.new(:black, self, [7,3])
    # @grid[[7,4]] = Queen.new(:black, self, [7,4])
    # @grid[[7,5]] = Bishop.new(:black, self, [7,5])
    # @grid[[7,6]] = Knight.new(:black, self, [7,6])
    # @grid[[7,7]] = Rook.new(:black, self, [7,7])
    # (0..7).each do |idx|
    #   @grid[[6,idx]] = Pawn.new(:black, self, [6,idx])
    # end
  end

  def initialize
    @grid = Array.new(8) {Array.new(8)}
  end

  def [](pos)
    row,col = pos
    @grid[row][col]
  end

  def []=(pos,value)
    row,col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos,end_pos)
    piece = self[start_pos]
    if self[start_pos].is_a?(NullPiece)
      raise "No piece at start position"
    elsif self[end_pos].is_a?(NullPiece) == false || end_pos == start_pos
      raise "Piece can not move to end position"
    else
      self[end_pos] = piece
      self[start_pos] = NullPiece.new
    end
  end

  def valid_pos?(pos)
    row, col = pos
    row >= 0 && row <= 7 && col >= 0 && col <=7
  end

end
