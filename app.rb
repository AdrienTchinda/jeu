#lignes qui appellent les gems du Gemfile.
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/player.rb et lib/game.rb
require_relative 'lib/player'
require_relative 'lib/game'

#INITIALISATION DES JOUEURS

player1 = Player.new("Josiane")
player2 = Player.new("José")

#BOUCLE DU COMBAT

while player1.life_points > 0 && player2.life_points >0 

	#AFFICHE LE NOMBRE DE VIES DU JOUEUR
	puts "Voici l'état du joueur 1 :" 
    puts "#{player1.show_state}"
    puts "Voici l'état du joueur 2 :"
    puts "#{player2.show_state}"
    puts "Passons à la phase d'attaque :"

    #JOSIANE ATTAQUE JOSE
    player1.attacks(player2)

    #SI JOSIANE N A PLUS DE VIE, LA BOUCLE S ARRETE
    if player1.life_points <= 0
        break

    #SINON JOSE ATTAQUE JOSIANE
	else
	    player2.attacks(player1)
    end

    #SI JOSIANE ET JOSE SONT ENCORE EN VIE, LA BOUCLE RECOMMENCE EN APPUYANT SUR ENTRER
    puts "Appuyer sur ENTRER pour continuer le combat"
    gets.chomp
end

binding pry
