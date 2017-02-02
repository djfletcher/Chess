

class Piece

  attr_accessor :current_position
  attr_reader  :team, :board

  def initialize(board, team, pos)
    @current_position = pos
    @board = board
    @team = team
  end

  def valid_moves
    moves.reject do |target_pos|
      board.move_piece(current_position, target_pos)
      is_valid = board.in_check?(team)
      board.undo_move(target_pos, current_position)
      is_valid
    end
  end

  def display
    @unicode_string.gsub(/\\u[\da-f]{4}/i) { |m| [m[-4..-1].to_i(16)].pack('U') }
  end

end
