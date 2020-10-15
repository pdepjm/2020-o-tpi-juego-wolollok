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
}

class Bomba inherits Obstaculo {
	var poderGolpe = 2
	var explosion = game.sound("explosion.wav")
	
	var imagen = "bomb.png"
	var posicion = game.at(5,5)
	
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

const bomba = new Bomba()

/*
class Pez inherits Obstaculo {
	
	const poderGolpe = 1
	var property movimiento // puede ser vertical u horizontal
	
	method teChocoElSubmarino() {
		submarino.perderUnaVida()
	}
	
	
	method moverse(){
		movimiento.moverseUnaVez(self)
	}
	
	method estaEnBordeInferior() = self.posicion().x() == 0
	
	method estaEnBordeSuperior() = self.posicion().x() == 50	
}
*/