import wollok.game.*
import yellowSubmarine.*
import items.*
import mercado.*

object submarino {
	var property estaEnMercado = false
	var property image = "submarino-right.png"
	var property position = game.at(9,12)
	var posicionAnterior
	var property vidas = 3
	var property monedas = 0
	var property tieneEscudo = false
	var property sobreElMercado = false
	
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
		tieneEscudo = true
		game.addVisual(escudo)
	}
	
	method perderEscudo(){
		tieneEscudo = false
		game.removeVisual(escudo)
	}
	
	method agarrarMonedas(cantMonedas){
		monedas += cantMonedas
		
		yellowSubmarine.analizarDificultad()
	}

	method perderTodasLasMonedas() { monedas = 0 }
	
	method ganar(){
		game.say(self, "GANASTE LA PARTIDA")
		game.schedule(2000, { game.stop()})
	}
	
	method entrarAlMercado(){
		estaEnMercado = true
	}
		
	method salirDelMercado(){
		estaEnMercado = false
		game.schedule(1, {self.moverseA(posicionAnterior)})
		sobreElMercado=false
	}
	method comprarVida(){
		if(vidas<3)
		{vidas+=1
		monedas-=mercado.precioVida()}
	}
	method comprarEscudo(){
		escudo.rodearSubmarino()
		monedas-=mercado.precioEscudo()
	}
}