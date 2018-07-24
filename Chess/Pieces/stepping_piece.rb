require 'byebug'

module SteppingPiece
  def move_dirs
    move_diffs
  end

  def moves
    moves = []
    move_dirs.each do |direction|
      potential_move = [self.pos[0] + direction[0], self.pos[1] + direction[1]]
      if valid_move?(potential_move)
        moves << potential_move
      end

      if !board[potential_move].nil? && board[potential_move].color != self.color
        unless potential_move[0] < 0 || potential_move[1] < 0
          moves << potential_move
        end
      end
    end
    moves.uniq
  end
end
