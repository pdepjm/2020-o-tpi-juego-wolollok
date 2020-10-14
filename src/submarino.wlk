import wollok.game.*
import items.*

object submarino {
	var property image = "submarino-right.png"
	var property position = game.at(9,12)
	var property vidas = 3
	var property monedas = 0
	var property escudo = false
	
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
	
	method activarEscudo(){
		escudo = true
		game.addVisual(escudoBuff)
	}
	
	method agregarMoneda(){
		
	}
	
	method perderEscudo(){
		
		// Evita perder vidas
		
		escudo = false
		game.removeVisual(escudoBuff)
	}
	
	method tieneEscudo() = escudo
}