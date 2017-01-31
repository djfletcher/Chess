require_relative 'piece'

class Pawn < Piece

  def initialize(board, team, pos)
    @symbol = :p
    super
  end

end
