require "pry"

class Player

  attr_accessor :names, :life_points
  @@all_players = []

  def initialize(names)
    @names = names
    @life_points = 10
    @@all_players << self
  end

  def self.names
    puts @@names
  end

  def self.life_points
    puts @@life_points
  end

  def show_state
    puts "#{@names} a #{@life_points} points de vie"
  end

  #dommages qu'inflige le joueur 1 sur le joueur 2

  def gets_damage(damage)
    @@allplayers[0].life_points = @@allplayers[0].life_points - damage
    if @@allplayers[0].life_points <= 0
      puts "le joueur #{@@allplayers[0].names} a été tué"
    end
  end

  #dommages qu'inflige le joueur 2 sur le joueur 1

  def gets_damage_second(damage)
    @@allplayers[1].life_points = @@allplayers[1].life_points - damage
    if @@allplayers[1].life_points <= 0
      puts "le joueur #{@@allplayers[1].names} a été tué"
    end 
  end

  def compute_damage
    return rand(1..6)
  end

  #attaque du joueur 1 sur le joueur 2

  def attacks(all_players)
    puts "le joueur #{@@all_players[0].names} attaque le joueur #{@@all_players[1].names}"
    damage_computed = compute_damage
    gets_damage(damage_computed)
    puts "il lui inflige #{damage_computed} points de dommages"
  end

  #attaque du joueur 2 sur le joueur 1

  def attacks_second(all_players)
    puts "le joueur #{@@all_players[1].names} attaque le joueur #{@@all_players[0].names}"
    damage_computed = compute_damage
    gets_damage_second(damage_computed)
    puts "il lui inflige #{damage_computed} points de dommages"
  end

  #combat à mort

  def combat
    while player1.life_points > 0 && player2.life_points >0 
      attacks(all_players)
      if @@all_players[1].life_points <= 0
        break
      else
        attacks_second(all_players)
      end
    end
  end

end



class HumanPlayer
  attr_accessor :weapon_level, :names, :life_points
  @@all_players = []

  def initialize(names)
    @names = names
    @life_points = 100
    @weapon_level = 1
    @@all_players << self
  end

  def self.names
    return @@names
  end

  def self.life_points
    return @@life_points
  end

  def show_state
    puts "#{@names} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    return rand(1..6) * @weapon_level
  end

  #recherche de l'arme

  def search_weapon
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}"
    if dice <= @weapon_level
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    else
      @weapon_level = dice
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    end
  end

  #recherche d'un pack de points de vie

  def search_health_pack
    n = 100 - life_points
    second_dice = rand(1..6)
    if second_dice == 1
      puts "Tu n'as rien trouvé... "
    elsif 2 <= second_dice <= 5
    if 1 <= @life_points <= 50
        @life_points = @life_points + 50
        puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif 50 < @life_points <= 100
        @life_points = @life_points + n
    end
    elsif second_dice == 6
      if 1 <= @life_points <= 20
        @life_points = @life_points + 80
      elsif 20 < life_points <= 100
        @life_points = @life_points + n
      end
    end          
  end

end

puts player1 = Player.new("Josiane")

binding pry
puts "end of file"