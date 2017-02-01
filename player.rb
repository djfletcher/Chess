class Player
  attr_reader :team
  def initialize(team, display)
    @team = team
    @display = display
    @name = get_name
  end

  def get_name
    puts "You are playing as #{team}."
    print "Enter your name, little fella: "
    gets.chomp.downcase.capitalize
  end

  def make_move
    @display.move(@team)
  end


end
