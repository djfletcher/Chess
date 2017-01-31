 require_relative "piece"
 require_relative "sliding_piece"

class Queen < Piece
  include SlidingPiece

  def move_dir
    :queen
  end


end
