module SlidingPiece

  def moves
    case @symbol
    when :R
      moves = lateral_moves
    when :B
      moves = diagonal_moves
    when :Q
      moves = lateral_moves + diagonal_moves
    end

    moves
  end

  def add_diagonal_movement
    moves = []
    (-7..7).each { |i| moves << [i, i] }
    moves
  end

  def lateral_moves
    current_row, current_col = @current_position
    unobstructed_moves = []

    (current_row - 1).downto(0) do |row|
      break if !(0..7).include?(row)
      piece = @board[[row, current_col]]
      break if piece.nil? || piece.team == @team
      unobstructed_moves << [row, current_col]
      break unless piece.is_a?(NullPiece)
    end

    (current_row + 1).upto(7) do |row|
      break if !(0..7).include?(row)
      piece = @board[[row, current_col]]
      break if piece.nil? || piece.team == @team
      unobstructed_moves << [row, current_col]
      break unless piece.is_a?(NullPiece)
    end

    (current_col - 1).downto(0) do |col|
      piece = @board[[current_row, col]]
      break if piece.nil? || piece.team == @team
      unobstructed_moves << [current_row, col]
      break unless piece.is_a?(NullPiece)
    end

    (current_row + 1).upto(7) do |col|
      piece = @board[[current_row, col]]
      break if piece.nil? || piece.team == @team
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
      break if !(0..7).include?(row)
      piece = @board[[row, col]]
      break if piece.nil? || piece.team == @team
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    (1..7).each do |i|
      row, col = current_row - i, current_col - i
      break if !(0..7).include?(row)
      piece = @board[[row, col]]
      break if piece.nil? || piece.team == @team
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    (1..7).each do |i|
      row, col = current_row + i, current_col - i
      break if !(0..7).include?(row)
      piece = @board[[row, col]]
      break if piece.nil? || piece.team == @team
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    (1..7).each do |i|
      row, col = current_row - i, current_col + i
      break if !(0..7).include?(row)
      piece = @board[[row, col]]
      break if piece.nil? || piece.team == @team
      unobstructed_moves << [row, col]
      break unless piece.is_a?(NullPiece)
    end

    unobstructed_moves
  end

  def reject_obstructed_moves_diagonal(moves)

  end


end
