#lignes qui appellent les gems du Gemfile.
require 'bundler'
Bundler.require

#lignes qui appellent les fichiers lib/player.rb et lib/game.rb
require_relative 'lib/player'
require_relative 'lib/game'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

#ON DEMANDE AU JOUEUR D ENTRER SON PRENOM QUI IRA DANS LA VARIABLE HUMANNAME
puts "Entrez votre prenom"
humanname = gets.chomp
user = HumanPlayer.new(humanname)

#ON INITIALISE LES 2 BOTS
player1 = Player.new("Josiane")
player2 = Player.new("José")

#CREATION DU TABLEAU DES ENNEMIS
enemies = [player1, player2]

#LA BOUCLE DU JEU
while user.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

  #AFFICHE LE NOMBRE DE VIE DU JOUEUR
  puts user.show_state

  puts "Quelle action veux-tu effectuer ?

a - chercher une meilleure arme
s - chercher à se soigner 

attaquer un joueur en vue :
0 - Josiane a #{player1.life_points} points de vie
1 - José a #{player2.life_points} points de vie"

  #ON INITIALISE K LA VARIABLE A QUI LE JOUEUR ATTRIBUERA UN STRING
  k = gets.chomp

  #LA BOUCLE IF DE L ACTION A EFFECTUER
  if k == "a"
  	user.search_weapon
  elsif k == "s"
  	user.search_health_pack
  elsif k == "0"
  	user.attacks(player1)
  elsif k == "1"
  	user.attacks(player2)
  end

  puts "Les autres joueurs t'attaquent !"

    #BOUCLE QUI INFLIGERA UNE ATTAQUE AU JOUEUR PAR CHAQUE ENNEMI
	  enemies.each do |enemy|
	  	if enemy.life_points >= 0
	  		enemy.attacks(user)
	  	end
	  end
  	
  	
end

puts "La partie est finie"

#SI LE JOUEUR EST MORT, AFFICHER QU IL A GAGNE
if user.life_points >0
	puts "BRAVO ! TU AS GAGNE !"

#SINON, AFFICHER QU IL A PERDU
else
	puts "Loser ! Tu as perdu !"
end

binding pry
