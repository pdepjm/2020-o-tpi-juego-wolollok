import wollok.game.*

object submarine {
	var property image = "submarino-right.png"
	var property position = game.at(9,12)
	var property vidas = 3
	var property cantMonedas = 0
	
	method moverseA(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method perdio(){
		game.say(self, "¡PERDÍ!")
		game.schedule(2000, { game.stop()})
	}
	
	method perderUnaVida(){
		vidas -= 1
	}
	
	method agregarMoneda(){
		cantMonedas += 1
	}
}

