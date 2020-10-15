import wollok.game.*
import yellowSubmarine.*
import items.*

object submarino {
	var property image = "submarino-right.png"
	var property position = game.at(9,12)
	var property vidas = 3
	var property monedas = 0
	var property escudo = false
	
	method moverseA(nuevaPosicion){
		if(self.noSaleDelAgua(nuevaPosicion))
			position = nuevaPosicion
	}
	
	method noSaleDelAgua(nuevaPosicion) {
		return (nuevaPosicion.x() >= 0 and
			    nuevaPosicion.x() <= yellowSubmarine.ancho_agua() and 
			    nuevaPosicion.y() >= 0 and 
			    nuevaPosicion.y() <= yellowSubmarine.alto_agua())
	}
	
	method perdio(){
		game.say(self, "¡PERDÍ!")
		game.schedule(2000, { game.stop()})
	}
	
	method perderVidas(poderGolpe) {
		vidas = (vidas - poderGolpe).max(0)
		if(vidas == 0)
			self.perdio()
	}
	
	method activarEscudo(){
		escudo = true
		game.addVisual(escudoBuff)
	}
	
	method perderEscudo(){
		escudo = false
		game.removeVisual(escudoBuff)
	}
	
	method tieneEscudo() = escudo
	
	method agarrarMonedas(cantMonedas){
		monedas += cantMonedas
	}
	
}