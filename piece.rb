require 'singleton'

class Piece

  attr_accessor :current_position
  attr_reader  :team

  def initialize(board , team, pos)
    @val = "X"
    @current_position = pos
    @board = board
    @team = team
  end

  def valid_moves
    # is called by Board to return all of its valid moves
    # returns array of valid moves
  end

  def display
    "X"
  end

  def move_dir
    # duck typing
  end

end


class NullPiece < Piece
  include Singleton

  def initialize

  end

  def display
    " "
  end

end
