class Player

  def initialize(team, display)
    @name = get_name
    @team = team
    @display = display
  end

  def get_name
    print "Enter your name, little fella: "
    gets.chomp.downcase.capitalize
  end

  def make_move
    
  end


end
