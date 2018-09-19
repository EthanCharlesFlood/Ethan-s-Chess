class BoardEvaluator

  VALUES = { Pawn => 10,
    Knight => 30,
    Bishop => 30,
    Rook => 50,
    Queen => 90,
    King => 900,
    NullPiece => 0
  }

  def initialize(board)
    @board = board
  end

  def simple_score(color)
      score = 0
      @board.pieces.each do |piece|
        score += VALUES[piece.class] if piece.color == color
        score -= VALUES[piece.class] if piece.color != color
      end
      score
  end

end
