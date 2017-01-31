
 require_relative "piece"
 require_relative "stepping_piece"
 class King < Piece
   include SteppingPiece

   def move_dir
     :king
   end

 end
