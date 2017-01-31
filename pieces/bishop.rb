require_relative 'piece'
require_relative 'sliding_piece'

class Bishop < Piece

 include SlidingPiece

 def initialize(board, team, pos)
   @symbol = :B
   super
 end

end
