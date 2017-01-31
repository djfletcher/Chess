require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = ' '
  end

  def display
    " "
  end

end
