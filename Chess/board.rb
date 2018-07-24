require_relative "pieces.rb"
require 'byebug'

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
    self[[0,0]] = Rook.new(:white, self, [0,0])
    self[[0,1]] = Knight.new(:white, self, [0,1])
    self[[0,2]] = Bishop.new(:white, self, [0,2])
    self[[0,3]] = Queen.new(:white, self, [0,3])
    self[[0,4]] = King.new(:white, self, [0,4])
    self[[0,5]] = Bishop.new(:white, self, [0,5])
    self[[0,6]] = Knight.new(:white, self, [0,6])
    self[[0,7]] = Rook.new(:white, self, [0,7])
    (0..7).each do |idx|
      self[[1,idx]] = Pawn.new(:white, self, [0,idx])
    end
  end

  def black_populate
    self[[7,0]] = Rook.new(:black, self, [7,0])
    self[[7,1]] = Knight.new(:black, self, [7,1])
    self[[7,2]] = Bishop.new(:black, self, [7,2])
    self[[7,3]] = King.new(:black, self, [7,3])
    self[[7,4]] = Queen.new(:black, self, [7,4])
    self[[7,5]] = Bishop.new(:black, self, [7,5])
    self[[7,6]] = Knight.new(:black, self, [7,6])
    self[[7,7]] = Rook.new(:black, self, [7,7])
    (0..7).each do |idx|
      self[[6,idx]] = Pawn.new(:black, self, [6,idx])
    end
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
