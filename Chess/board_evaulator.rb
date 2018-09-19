class BoardEvaluator

  VALUES = { Pawn => 10,
    Knight => 30,
    Bishop => 30,
    Rook => 50,
    Queen => 90,
    King => 900
  }

  def initialize(board, player, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def simple_score
      score = 0
      
      @player1.pieces.each do |piece|
        score += VALUES[piece.class]
      end

      @player2.pieces.each do |piece|
        score -= VALUES[piece.class]
      end

      score
  end

end
