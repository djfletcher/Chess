class Piece
  def initialize
    @val = "X"
  end

  def display
    "X"
  end
end


class NullPiece < Piece


  def display
    " "
  end
end
