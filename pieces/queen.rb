require_relative 'sliding_piece'
require_relative 'piece'

class Queen < Piece
  include SlidingPiece

  def initialize(board, team, pos)
    @symbol = :Q
    super
  end

end
