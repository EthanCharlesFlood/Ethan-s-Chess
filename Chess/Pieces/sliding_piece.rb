require 'byebug'
module SlidingPiece
  HORIZONTAL_DIRS = [
    [1,0],
    [-1,0],
    [0,1],
    [0,-1]
  ]
  DIAGONAL_DIRS =[
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1],
  ]


  def moves
    moves = []
    move_dirs.each do |direction|
      moves += grow_unblocked_moves_in_dir(direction[0], direction[1])
    end
    moves
  end

  private

  def move_dirs
    raise "no #move_dirs method implemented"
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    unblocked_moves = []
    potential_move = [self.pos[0] + dx, self.pos[1] + dy]

    until valid_move?(potential_move) == false
        unblocked_moves << potential_move

        potential_move = [potential_move[0] + dx, potential_move[1] + dy]
    end
    unless potential_move[0] < 0 || potential_move[1] < 0 || potential_move[0] > 7 || potential_move[1] > 7
      if !board[potential_move].nil? && board[potential_move].color != self.color
        unblocked_moves << potential_move
      end
    end

    unblocked_moves
  end

  def valid_move?(pos)
    if @board.valid_pos?(pos) == false
      return false
    elsif @board[pos].empty? == false
      return false
    end
    true
  end

end
