module SteppingPiece

  def moves(piece_type)
    moves = []
    case piece_type
    when :king
      moves += king_moves.map do |diff|
        [@position[0] + diff[0], @position[1] + diff[1]]
      end
    when :knight
      moves += knight_moves.map do |diff|
       [@position[0] + diff[0], @position[1] + diff[1]]
      end
    end
    moves.select { |row, col| row.between?(0, 7) && col.between?(0, 7)}
  end

  def king_moves
    moves = []
      (-1..1).each do |i|
        (-1..1).each do |j|
          moves << [i, j]
        end
      end
      moves.delete([0, 0])
      moves
  end

  def knight_moves
    [[-2 , -1],[-1, -2],[-2 ,1],[1, -2],[2,-1],[-1, 2],[2, 1],[1, 2]]
  end


end
