class Piece

  def initialize(board , team, pos)
    @val = "X"
    @current_position = pos
    @board = board
    @team = team
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
