class Pawn < Piece
  def symbol
    :P
  end

  def moves
    forward_steps + side_attacks
  end

  # private

  def at_start_row?
    if color == :black
      pos[0] == 6
    elsif color == :white
      pos[0] == 1
    end
  end

  def forward_steps
    fmoves = []
    x, y = pos
    if color == :black
      fmoves.push([(x - 1), y]) if board[[(x - 1), y]].empty? && board.valid_pos?([(x - 1), y])
      return fmoves if fmoves.length == 0
      if at_start_row?
        fmoves.push([(x - 2), y]) if board[[(x - 2), y]].empty? && board.valid_pos?([(x - 2), y])
      end
    elsif color == :white
      fmoves.push([(x + 1), y]) if board[[(x + 1), y]].empty? && board.valid_pos?([(x + 1), y])
      return fmoves if fmoves.length == 0
      if at_start_row?
        fmoves.push([(x + 2), y]) if board[[(x + 2), y]].empty? && board.valid_pos?([(x + 2), y])
      end
    end
    fmoves
  end

  def side_attacks
    samoves = []
    x, y = pos
    if color == :black
      if board.valid_pos?([(x - 1), (y - 1)])
        samoves.push([(x - 1), (y - 1)]) if board[[(x - 1), (y - 1)]].color == :white
      end
      if board.valid_pos?([(x - 1), (y + 1)])
        samoves.push([(x - 1), (y + 1)]) if board[[(x - 1), (y + 1)]].color == :white
      end
    elsif color == :white
      if board.valid_pos?([(x + 1), (y + 1)])
        samoves.push([(x + 1),(y + 1)]) if board[[(x + 1),(y + 1)]].color == :black
      end
      if board.valid_pos?([(x + 1), (y - 1)])
        samoves.push([(x + 1),(y - 1)]) if board[[(x + 1),(y - 1)]].color == :black
      end
    end
    samoves
  end
end
