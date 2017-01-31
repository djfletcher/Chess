require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
   include SteppingPiece

   def initialize(board, team, pos)
     @symbol = :K
     super
   end

end
