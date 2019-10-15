
class Game
	attr_accessor :human_player, :enemies

    def initialize(names)
      @names = names
      @life_points = 10
      @enemies = []
    end

end