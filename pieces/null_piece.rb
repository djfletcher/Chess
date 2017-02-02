require 'singleton'
require_relative 'piece'

class NullPiece < Piece
  include Singleton

  def initialize
    @symbol = ' '
    @unicode_string = ' '
  end

  def display
    " "
  end

end
