require 'colorize'
require_relative 'cursor'
require 'rainbow'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    @board.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        if [row_index, col_index] == @cursor.cursor_pos && @cursor.selected
          print "|#{piece.display}|".red.underline
        elsif [row_index, col_index] == @cursor.cursor_pos
          print "|#{piece.display}|".cyan.underline
        else
          print "|#{piece.display}|".underline
        end
      end
      puts
    end

  end



end
