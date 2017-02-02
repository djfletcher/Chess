require_relative 'sliding_piece'
require_relative 'piece'

class Queen < Piece
  include SlidingPiece

  def initialize(board, team, pos)
    @symbol = :Q
    case team
    when :white
      @unicode_string = ''
    when :black
      @unicode_string = ''
    end
    super
  end

end
