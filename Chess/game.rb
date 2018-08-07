require_relative "display.rb"

class Game
  attr_reader :board, :display, :current_player, :players

  def initialize
    @board = Board.new.populate
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display),
    }
    @current_player = :white
  end

  def play
    until @board.checkmate?(@current_player)
      begin
      rescue
        @display.notifications[:error] = e.message
        retry
      end
    end
  end












end
