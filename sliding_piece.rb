module SlidingPiece

  def moves
    case move_dir
    when :rook
      moves = lateral_moves
    when :bishop
      moves = diagonal_moves
    when :queen
      moves = lateral_moves + diagonal_moves
    end

    moves
  end

  # def adjust_to_current_position(moves)
  #   moves = moves.map do |diff|
  #     [@current_position[0] + diff[0], @current_position[1] + diff[1]]
  #   end
  #   moves.delete([0, 0])
  #   moves.select { |row, col| row.between?(0, 7) && col.between?(0, 7) }
  # end

  # def add_lateral_movement
  #   moves = []
  #   (-7..7).each do |i|
  #     (-7..7).each { |j| moves << [i, j] if i == 0  || j == 0 }
  #   end
  #   moves
  # end

  def add_diagonal_movement
    moves = []
    (-7..7).each { |i| moves << [i, i] }
    moves
  end

  def lateral_moves
    current_row, current_col = @current_position
    unobstructed_moves = []

    (current_row - 1).downto(0) do |row|
      piece = @board[[row, current_col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [row, current_col]
      break unless piece.is_a?(NullPiece)
    end

    (current_row + 1).upto(7) do |row|
      piece = @board[[row, current_col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [row, current_col]
      break unless piece.is_a?(NullPiece)
    end

    (current_col - 1).downto(0) do |col|
      piece = @board[[current_row, col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [current_row, col]
      break unless piece.is_a?(NullPiece)
    end

    (current_row + 1).upto(7) do |col|
      piece = @board[[current_row, col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [current_row, col]
      break unless piece.is_a?(NullPiece)
    end

    unobstructed_moves
  end

  def diagonal_moves
    current_row, current_col = @current_position
    unobstructed_moves = []

    (1..7).each do |i|
      row, col = current_row + i, current_col + i
      piece = @board[[row, col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    (1..7).each do |i|
      row, col = current_row - i, current_col - i
      piece = @board[[row, col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    (1..7).each do |i|
      row, col = current_row + i, current_col - i
      piece = @board[[row, col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    (1..7).each do |i|
      row, col = current_row - i, current_col + i
      piece = @board[[row, col]]
      break if piece.team == @team || piece.nil?
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    unobstructed_moves
  end

  def reject_obstructed_moves_diagonal(moves)

  end


end
