module SlidingPiece

  def moves
    moves = []
    case move_dir
    when :rook
      moves += add_lateral_movement.map do |diff|
        [@position[0] + diff[0], @position[1] + diff[1]]
      end
    when :bishop
      moves += add_diagonal_movement.map do |diff|
        [@position[0] + diff[0], @position[1] + diff[1]]
      end
    when :queen
      moves += add_lateral_movement + add_diagonal_movement
      moves.map! do |diff|
        [@position[0] + diff[0], @position[1] + diff[1]]
      end
    end
    moves.delete([0, 0])
    moves.select { |row, col| row.between?(0, 7) && col.between?(0, 7) }
  end

  def add_lateral_movement
    moves = []
    (-7..7).each do |i|
      (-7..7).each { |j| moves << [i, j] if i == 0  || j == 0 }
    end
    moves
  end

  def add_diagonal_movement
    moves = []
    (-7..7).each { |i| moves << [i, i] }
    moves
  end

end
