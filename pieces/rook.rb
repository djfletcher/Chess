require_relative 'piece'
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  def initialize(board, team, pos)
    @symbol = :R
    super
  end

end
