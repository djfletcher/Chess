require_relative 'piece'
require_relative 'display'

class Board

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @null_piece = NullPiece.new
    populate_board
  end

  def populate_board
     grid.map!.with_index do |row, index_row|
        row.map!.with_index do |square, index_col|
          if [0,1,6,7].include?(index_row)
            Piece.new(self,:white,[index_row, index_col] )
          else
            @null_piece
          end
        end
      end
  end

  #TODO add real pieces
  def move_piece(start_pos, end_pos)
    raise "No piece at #{start_pos}" if self[start_pos].is_a?(NullPiece)
    raise "Invalid end position: #{end_pos}" if self[start_pos].valid_move?(start_pos, end_pos)
    self[end_pos] = self[start_pos]
    self[start_pos] = @null_piece
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

  private

  attr_reader :grid

end


board = Board.new()
display = Display.new(board)
display.render
