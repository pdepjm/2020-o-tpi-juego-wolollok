import wollok.game.*

object submarine {
	var property image = "submarino.png"
	var property position = game.at(9,12)
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method perdio(){
		game.say(self, "¡PERDÍ!")
		game.schedule(2000, { game.stop()})
	}
}

