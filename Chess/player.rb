class Player
  attr_reader :color, :display

  def initialize(color, display)
    @color = color
    @display = display
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

end
