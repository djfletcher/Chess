 require_relative "piece"
 require_relative "stepping_piece"

class Knight < Piece
  include SteppingPiece

  def move_dir
    :knight
  end

end
