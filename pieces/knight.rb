require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def initialize(board, team, pos)
    @symbol = :N
    super
  end

end
