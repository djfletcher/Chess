require_relative 'board'
require_relative 'player'
require_relative 'display'

class Chess

  def initialize(player_one, player_two)
    @board = Board.new
    @player_one, @player_two = Player.new(:white), Player.new(:black)
    @current_player = @player_one
    @display = Display.new(@board)
  end

  def run

  end

  def play_turn
    @display.render

  end

  def switch_players
    @current_player = (@current_player == @player_one ? @player_one  : @player_two)
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Chess.new()
  game.run
end
