
class Player

  #INITIALISATION DES VARIABLES DE CLASSE
  attr_accessor :names, :life_points
  @@all_players = []

  def initialize(names)
    @names = names
    @life_points = 10
    @@all_players << self
  end

  #AFFICHE LE NOMBRE DE POINTS DE VIE DU JOUEUR
  def show_state
    puts "#{names} a #{life_points} points de vie"
  end

  #DOMMAGE INFLIGE SUR LE JOUEUR

  def gets_damage(damage)
    damage = damage.to_i
    @life_points = @life_points - damage
    if @life_points <= 0
      puts "le joueur #{names} a été tué"
    end
  end

  #CALCUL ALEATOIRE DU DOMMAGE
  def compute_damage
    return rand(1..6)
  end

  #ATTAQUE DU JOUEUR SUR SA VICTIME

  def attacks(victim)
    #AFFICHE LE JOUEUR ATTAQUANT SA VICTIME
    puts "le joueur #{self.names} attaque le joueur #{victim.names}"

    #DAMAGE_COMPUTED PREND LA VALEUR DU NOMBRE OBTENU ALEATOIREMENT
    damage_computed = compute_damage

    #AFFICHE LE NOMBRE DE DOMMAGES INFLIGES
    puts "il lui inflige #{damage_computed} points de dommages"

    #VICTIM RECOIS LES DOMMAGES
    victim.gets_damage(damage_computed)
  end


end



class HumanPlayer < Player
  #INITIALISATION DES VARIABLES DE CLASSE
  attr_accessor :weapon_level, :names, :life_points
  @@all_players = []

  def initialize(names)
    @names = names
    @life_points = 100
    @weapon_level = 1
    @@all_players << self
  end

  #AFFICHE LE NOMBRE DE POINTS DE VIE DU JOUEUR
  def show_state
    puts "#{@names} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  #CALCUL ALEATOIRE DU DOMMAGE ET MULTIPLICATION DE CELUI-CI PAR LE NIVEAU DE L ARME
  def compute_damage
    return rand(1..6) * @weapon_level
  end

  #RECHERCHE DE L ARME
  def search_weapon

    #LANCER DE DE
    dice = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice}"

    #SI LE RESULTAT DU DE EST INFERIEUR AU NIVEAU DE L ARME, AFFICHER...
    if dice <= @weapon_level
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."

    #SINON, AFFICHER...  
    else
      @weapon_level = dice
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    end
  end

  #RECHERCHE D UN PACK DE VIE

  def search_health_pack
    #DIFFERENCE ENTRE 100 ET LE NOMBRE DE VIES
    n = 100 - life_points

    #LANCER DE DE
    second_dice = rand(1..6)

    #SI LE RESULTAT DU LANCER DE DE EST EGAL A 1, AFFICHER...
    if second_dice == 1
      puts "Tu n'as rien trouvé... "

    #SINON, SI LE RESULTAT DU LANCER DE DE EST COMPRIS ENTRE 2 ET 5 INCLUS, ALORS..
    elsif 2 <= second_dice && second_dice <= 5

      #SI SON NOMBRE DE VIES EST COMPRIS ENTRE 1 ET 50 INCLUS, LE JOUEUR GAGNE 50 VIES
      if 1 <= life_points && life_points <= 50
          life_points = life_points + 50
          puts "Bravo, tu as trouvé un pack de +50 points de vie !"

      #SINON SI SON NOMBRE DE VIES EST COMPRIS ENTRE 51 ET 100 INCLUS, LE JOUEUR GAGNE N VIES (POUR NE PAS DEPASSER 100 VIES)
      elsif 50 < @life_points && @life_points <= 100
          @life_points = @life_points + n
          puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      end

    #SINON SI LE RESULTAT DU LANCER DE DE EST EGAL A 6, ALORS..
    elsif second_dice == 6

      #SI LE NOMBRE DE VIES EST COMPRIS ENTRE 1 ET 20 INCLUS, LE JOUEUR GAGNE 80 VIES
      if 1 <= @life_points && @life_points <= 20
        @life_points = @life_points + 80
        puts "Bravo, tu as trouvé un pack de +80 points de vie !"

      #SINON SI LE NOMBRE DE VIES EST COMPRIS ENTRE 20 ET 100 INCLUS, LE JOUEUR GAGNE N VIES (POUR NE PAS DEPASSER 100 VIES)  
      elsif 20 < life_points && life_points <= 100
        @life_points = @life_points + n
        puts "Bravo, tu as trouvé un pack de +80 points de vie !"
      end
    end          
  end

end
