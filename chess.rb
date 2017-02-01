require_relative 'board'
require_relative 'player'
require_relative 'display'

class Chess

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @player_one, @player_two = Player.new(:white, @display), Player.new(:black, @display)
    @current_player = @player_one
  end

  def run
    loop do
      # break if @board.checkmate?(@current_player.team)
      play_turn
      switch_players
    end
  end

  def play_turn
    @current_player.make_move

  end

  def switch_players
    @current_player = (@current_player == @player_one ? @player_two : @player_one )
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Chess.new
  game.run
end
