require_relative "player.rb"

class ComputerPlayer < Player

  # inherits a color and a display in initialize from payer class
  def make_move

  end

  def pieces
    @display.board.pieces.select { |piece| piece.color == @color }
  end

  def moves
    moves = []
    pieces.each do |piece|
      piece.moves.each do |move|
        moves << [piece.pos, move]
      end
    end
    moves
  end

  # very naive implementation of computer player
  def easy_ai_make_move
    moves.sample
  end

  # slightly less naive implementation; will take pieces when given the opportunity
  def points_of_attack
    potential_attacks = []
    moves.each do |move|
      if display.board[move[1]].color != display.board[move[0]].color && display.board[move[1]].color != :none
        potential_attacks << move
      end
    end
    potential_attacks
  end

  def more_aggressive_ai_make_move
    potential_attacks = points_of_attack
    if potential_attacks.length < 1
      moves.sample
    else
      potential_attacks.sample
    end
  end

end
