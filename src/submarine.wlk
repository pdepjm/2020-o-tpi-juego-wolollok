import wollok.game.*

object submarine {
	var property image = "yellow.png"
	var property position = game.origin()
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}

}

