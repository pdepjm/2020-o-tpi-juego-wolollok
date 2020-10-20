import wollok.game.*
import yellowSubmarine.*
import items.*

object submarino {
	var property image = "submarino-right.png"
	var property position = game.at(9,12)
	var posicionAnterior
	var property vidas = 3
	var property monedas = 0
	var property escudo = false
	
	method moverseA(nuevaPosicion){
		
		if(yellowSubmarine.noSaleDelAgua(nuevaPosicion) and yellowSubmarine.noChocaConPiedra(nuevaPosicion)){
			posicionAnterior = position
			position = nuevaPosicion
		}else if(yellowSubmarine.noSaleDelAgua(nuevaPosicion) and yellowSubmarine.chocaConPiedra(nuevaPosicion)){
			posicionAnterior = position
			position = nuevaPosicion
			game.schedule(500, {self.moverseA(posicionAnterior)})
			
		}
			
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
		
		yellowSubmarine.actualizarDificultad()
	}
	
	method ganar(){
		game.say(self, "GANASTE LA PARTIDA")
		game.schedule(2000, { game.stop()})
	}
	
}