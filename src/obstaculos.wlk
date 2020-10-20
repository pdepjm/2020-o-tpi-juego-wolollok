import wollok.game.*
import yellowSubmarine.*
import submarino.*
import movimientos.*


class Obstaculo {	 
	
	method golpearSubmarino(poderGolpe){
		if(submarino.tieneEscudo())
			submarino.perderEscudo()
		else
			submarino.perderVidas(poderGolpe)
	}
}

class Piedra inherits Obstaculo{
	const poderGolpe = 1
	var imagen
	var posicion
	
	method image() = imagen
	method position() = posicion
	
	method teChocoElSubmarino(){
		self.golpearSubmarino(poderGolpe)	
	}
}


class Bomba inherits Obstaculo {
	var poderGolpe = 2
	var explosion = game.sound("explosion.wav")
	
	var imagen = "bomb.png"
	var posicion
	
	method image() = imagen
	method position() = posicion
	
	method teChocoElSubmarino(){
		self.golpearSubmarino(poderGolpe)
		self.explotar()	
	}
	
	method explotar() {
		imagen = "explosion.png"
		explosion.volume(0.05)
		explosion.play()
		poderGolpe = 0 
		yellowSubmarine.borrarVisual(1000,self)
	}
}

class Tiburon inherits Obstaculo {
	
	var posicion 
	var imagen 
	const movimiento 	// puede ser vertical u horizontal
	const poderGolpe = 1
	
	method image() = imagen
	method image(imagenNueva) { imagen = imagenNueva } 
	
	method position() = posicion
	
	method teChocoElSubmarino() {
		self.golpearSubmarino(poderGolpe)
	}
	
	method moverse() { posicion = movimiento.moverseUnaVez(self) }	
}


