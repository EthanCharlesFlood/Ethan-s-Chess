require_relative "player.rb"

class ComputerPlayer < Player

  # inherits a color and a display in initialize from payer class
  def make_move
    more_aggressive_ai_make_move
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

  # implementation which evaluates piece value and acts accordingly

  def take_best_piece
    best move = nil
    best_value = -10000

    moves.each do |move|
      

  end
end
