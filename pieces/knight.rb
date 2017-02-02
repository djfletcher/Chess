require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece
  include SteppingPiece

  def initialize(board, team, pos)
    @symbol = :N
    case team
    when :white
      @unicode_string = ''
    when :black
      @unicode_string = ''
    end
    super
  end

end
