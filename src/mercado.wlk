import wollok.game.*
import submarine.*

object mercado {
	var property image = "Boat Shop.png"
	var property position = game.at(1,12)
	method teChocoElSubmarino(){
		game.say(self, "HOLA, QUE QUERES?")
	}
}
