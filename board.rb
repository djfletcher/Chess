require_relative 'display'
# Dir["./pieces/*.rb"].each {|file| require file }
require_relative './pieces/rook'
require_relative './pieces/pawn'
require_relative './pieces/null_piece'
require_relative './pieces/queen'
require_relative './pieces/knight'
require_relative './pieces/king'
require_relative './pieces/bishop'
require_relative './pieces/rook'


class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @null_piece = NullPiece.instance
    @white_king = nil
    @black_king = nil
    populate_board
  end

  def populate_board
    grid.map!.with_index do |row, index_row|
        # row.map!.with_index do |square, index_col|
          # if [0,1,6,7].include?(index_row)
      case index_row
      when 0
        place_pieces(:white, index_row)
      when 1
        place_pawns(:white, index_row)
      when 6
        place_pawns(:black, index_row)
      when 7
        place_pieces(:black, index_row)
      # Piece.new(self,:white,[index_row, index_col] )
      else
        place_nulls
      end
        # end
    end
  end

  def place_pieces(team, row)
    (0..7).map do |col|
      case col
      when 0, 7
        Rook.new(self, team, [row, col])
      when 1, 6
        Knight.new(self, team, [row, col])
      when 2, 5
        Bishop.new(self, team, [row, col])
      when 3
        Queen.new(self, team, [row, col])
      when 4
        king = King.new(self, team, [row, col])
        row == 0 ? @white_king = king : @black_king = king
        king
      end
    end
  end

  def place_pawns(team, row)
    (0..7).map { |col| Pawn.new(self, team, [row, col]) }
  end

  def place_nulls
    [@null_piece] * 8
  end

  #TODO add real pieces
  def move_piece(start_pos, end_pos)
    raise "No piece at #{start_pos}" if self[start_pos].is_a?(NullPiece) || !in_bound?(start_pos)
    raise "Invalid end position: #{end_pos}" unless self[start_pos].valid_moves.include?(end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = @null_piece
    self[end_pos].current_position = end_pos
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def in_bound?(pos)
    !self[pos].nil?
  end

  def each(&prc)
    @grid.each(&prc)
  end

  def each_with_index(&prc)
    @grid.each_with_index(&prc)
  end

  def in_check?(team)
    king = (team == :white ? @white_king : @black_king)
    grid.each do |row|
      row.each do |col|
        piece = self[row, col]
        next if piece.team == team
        return true if piece.moves.include?(king.current_position)
      end
    end

    false
  end

  def checkmate?(team)
    king = (team == :white ? @white_king : @black_king)
    return false if king.valid_moves.any?
    # check if some one can block the check
    grid.each do |row|
      row.each do |col|
        piece = self[row, col]
        next unless piece.team == team
        return false if piece.valid_moves.any?
      end
    end

    true
  end

  def undo_move(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = @null_piece
    self[end_pos].current_position = end_pos
  end

  private

  attr_reader :grid

end


board = Board.new()
display = Display.new(board)
display.render
