require 'colorize'
require_relative 'cursor'
require 'rainbow'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
    @first_selection = nil
    @second_selection = nil
  end

  def render
    system("clear")
    @board.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        if [row_index, col_index] == @cursor.selected_pos
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


  # def toggle_selected
  #   @cursor.toggle_selected
  # end
  def move()


  end

  def get_moves
    valid_selection_count = 0
    until valid_selection_count == 2
      render
      pos = get_input
      @first_selection = pos if @cure
      @second_selection = nil
    end
  end

  def get_input
    @cursor.get_input
  end


end
