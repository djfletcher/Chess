require_relative "piece"
require_relative "sliding_piece"
class Bishop < Piece

 include SlidingPiece

 def move_dir
   :bishop
 end


end