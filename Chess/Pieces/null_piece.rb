require 'singleton'
require_relative "piece"

class NullPiece < Piece
  include Singleton

  def initialize
    @color = :none
  end

  def empty?
    true
  end

  def symbol
    " "
  end

  def to_s
    " "
  end

  def moves
    []
  end
end
