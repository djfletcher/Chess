require_relative 'piece'
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  def initialize(board, team, pos)
    @symbol = :R
    case team
    when :white
      @unicode_string = ''
    when :black
      @unicode_string = ''
    end
    super
  end

end
