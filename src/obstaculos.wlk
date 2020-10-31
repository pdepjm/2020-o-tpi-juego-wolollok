import wollok.game.*
import yellowSubmarine.*
import submarino.*
import movimientos.*

class Obstaculo {	 

	method teChocoElSubmarino(){
		if(submarino.tieneEscudo())
			submarino.perderEscudo()
		else
			self.accionAlChocar()
	}

	method accionAlChocar()
}

class ObstaculoConPoder inherits Obstaculo{	 
	
	method poderGolpe()

	override method accionAlChocar(){
		self.golpearSubmarino(self.poderGolpe())
	}

	method golpearSubmarino(poderGolpe){
		submarino.perderVidas(poderGolpe)
	}
}

class Piedra inherits ObstaculoConPoder {
	var imagen
	var posicion
	var sonido_piedra = game.sound("choque_piedra.wav")
	
	override method poderGolpe() = 1
	method image() = imagen
	method position() = posicion
	
	override method accionAlChocar(){
		super()
		//sonido_piedra.volume(0.1)
		//sonido_piedra.play()	
	}
}


class Bomba inherits ObstaculoConPoder {
	var explosion = game.sound("explosion.wav")
	var imagen = "bomb.png"
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	var poderGolpe = 2
	
	override method poderGolpe() = poderGolpe
	method image() = imagen
	method position() = posicion
	
	override method accionAlChocar(){
		super()
		self.explotar()	
	}
	
	method explotar() {
		imagen = "explosion.png"
		//explosion.volume(0.05)
		//explosion.play()
		poderGolpe = 0 
		yellowSubmarine.borrarVisual(1000,self)
	}
}

class Tiburon inherits ObstaculoConPoder {
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	const movimiento 	// puede ser vertical u horizontal
	var distancia
	var velocidad
	
	override method poderGolpe() = 1
	method image() = "tiburon_" + movimiento.imagen() + ".png"
	method position() = posicion
	method distancia() = distancia
	method velocidad() = velocidad
	method movimiento() = movimiento
	
	method moverse() { posicion = movimiento.moverseUnaVez(self) }	
}

class Pulpo inherits Obstaculo {

	var velocidad
	var movimiento = aleatorio
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	
	method image() = "EvilOctopus.png"
	method position() = posicion
	
	method velocidad() = velocidad

	override method accionAlChocar(){
		self.robarMonedas()
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


