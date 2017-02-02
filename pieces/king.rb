require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece
   include SteppingPiece

   def initialize(board, team, pos)
     @symbol = :K
     case team
     when :white
       @unicode_string = 'U+2654'
     when :black
       @unicode_string = 'U+265A'
     end
     super
   end

end
