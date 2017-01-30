require_relative 'piece'

class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    populate_board
  end

  def populate_board
     grid.map!.with_index do |row, index|
        row.map! do |square|
          if [0,1,6,7].include?(index)
            Piece.new
          else
            NullPiece.new
          end
        end
      end
  end


  def move_piece(start_pos, end_pos)
    raise "No piece at #{start_pos}" if self[start_pos].is_a?(NullPiece)
    raise "Invalid end position: #{end_pos}" if self[start_pos].valid_move?(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = NullPiece.new
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  private

  attr_reader :grid

end
