require_relative "piece"
require_relative "sliding_piece"
class Rook < Piece
  include SlidingPiece

  def move_dir
    :rook
  end
end
