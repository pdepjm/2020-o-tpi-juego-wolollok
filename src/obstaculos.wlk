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

class Piedra inherits Obstaculo {
	const poderGolpe = 1
	var imagen
	var posicion
	var sonido_piedra = game.sound("choque_piedra.wav")
	
	method image() = imagen
	method position() = posicion
	
	method teChocoElSubmarino(){
		sonido_piedra.volume(0.1)
		sonido_piedra.play()	
		self.golpearSubmarino(poderGolpe)
	}
}


class Bomba inherits Obstaculo {
	var poderGolpe = 2
	var explosion = game.sound("explosion.wav")
	var imagen = "bomb.png"
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	
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
	
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	const movimiento 	// puede ser vertical u horizontal
	const poderGolpe = 1
	var distancia
	var velocidad
	
	method image() = "tiburon_" + movimiento.imagen() + ".png"
	method position() = posicion
	method distancia() = distancia
	method velocidad() = velocidad
	method movimiento() = movimiento
	
	method teChocoElSubmarino() {
		self.golpearSubmarino(poderGolpe)
	}
	
	method moverse() { posicion = movimiento.moverseUnaVez(self) }	
}

class Pulpo inherits Obstaculo {
	const poderGolpe = 0
	var velocidad
	var movimiento = aleatorio
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	
	method image() = "EvilOctopus.png"
	method position() = posicion
	
	method velocidad() = velocidad

	method teChocoElSubmarino(){
		self.golpearSubmarino(poderGolpe)
	}

	override method golpearSubmarino(danio){
		if(submarino.tieneEscudo())
			submarino.perderEscudo()
		else{
			submarino.perderVidas(danio)
			self.robarMonedas()
		}
	}

	method robarMonedas() {
		submarino.perderTodasLasMonedas()
	}	

	method moverse() { posicion = movimiento.posicion() }	
}

object iman {
	var property frecuenciaAtraccion = 3000
		
	method image() = "magnet.png"
	method position() = game.at(0,6)
	
	method teChocoElSubmarino() {}
	
	method atraerSubmarino() {
		if(!submarino.estaEnMercado())
			submarino.moverseA(submarino.position().left(1))
	}
}


