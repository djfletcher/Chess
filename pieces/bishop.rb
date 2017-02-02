require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece

 include SlidingPiece

 def initialize(board, team, pos)
   @symbol = :B
   case team
   when :white
     @unicode_string = ''
   when :black
     @unicode_string = ''
   end
   super
 end

end
