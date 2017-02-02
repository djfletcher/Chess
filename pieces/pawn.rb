require_relative 'piece'

class Pawn < Piece

  def initialize(board, team, pos)
    @symbol = :p
    case team
    when :white
      @unicode_string = ''
    when :black
      @unicode_string = ''
    end
    super
  end

  def moves
    current_row, current_col = @current_position

    case @team
    when :white
      definite_deltas = [[1, 0]]
      conditional_deltas = [[1, -1], [1, 1]]
      first_move_deltas = [[2, 0]]

      unobstructed_moves = definite_deltas.map { |delta| [current_row + delta[0] , current_col + delta[1]] }.select { |pos| @board[pos].is_a?(NullPiece) }

      if current_row == 1
        unobstructed_moves += first_move_deltas.map { |delta| [current_row + delta[0] , current_col + delta[1]] }.select { |pos| @board[pos].is_a?(NullPiece) && @board[[current_row + 1, current_col]].is_a?(NullPiece) }
      end

      unobstructed_moves += conditional_deltas.map { |delta| [current_row + delta[0] , current_col + delta[1]] }.select { |pos| !@board[pos].is_a?(NullPiece) && @board[pos].team != @team }

    when :black
      definite_deltas = [[-1, 0]]
      conditional_deltas = [[-1, -1], [-1, 1]]
      first_move_deltas = [[-2, 0]]

      unobstructed_moves = definite_deltas.map { |delta| [current_row + delta[0] , current_col + delta[1]] }.select { |pos| @board[pos].is_a?(NullPiece) }

      if current_row == 6
        unobstructed_moves += first_move_deltas.map { |delta| [current_row + delta[0] , current_col + delta[1]] }.select { |pos| @board[pos].is_a?(NullPiece) && @board[[current_row - 1, current_col]].is_a?(NullPiece) }
      end

      unobstructed_moves += conditional_deltas.map { |delta| [current_row + delta[0] , current_col + delta[1]] }.select { |pos| !@board[pos].is_a?(NullPiece) && @board[pos].team != @team }
    end

    unobstructed_moves.reject { |pos| !@board.in_bound?(pos) }
  end







end
