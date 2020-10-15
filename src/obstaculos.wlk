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

const piedra1 = new Piedra(posicion = game.at(0,2),imagen = "Stone_6.png")
const piedra2 = new Piedra(posicion = game.at(0,4),imagen = "Stone_6.png")
const piedra3 = new Piedra(posicion = game.at(0,5),imagen = "Stone_6.png")
const piedra4 = new Piedra(posicion = game.at(0,7),imagen = "Stone_6.png")

const piedra5 = new Piedra(posicion = game.at(19,3),imagen = "Stone_6.png")
const piedra6 = new Piedra(posicion = game.at(19,5),imagen = "Stone_6.png")
const piedra7 = new Piedra(posicion = game.at(19,6),imagen = "Stone_6.png")
const piedra8 = new Piedra(posicion = game.at(19,1),imagen = "Stone_6.png")

const piedra9 = new Piedra(posicion = game.at(5,0),imagen = "Stone_6.png")
const piedra10 = new Piedra(posicion = game.at(7,0),imagen = "Stone_6.png")
const piedra11 = new Piedra(posicion = game.at(5,1),imagen = "Stone_6.png")
const piedra12 = new Piedra(posicion = game.at(7,1),imagen = "Stone_6.png")


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

const bomba1 = new Bomba(posicion = game.at(5,5))
const bomba2 = new Bomba(posicion = game.at(10,5))

/*
class Tiburon inherits Obstaculo {
	
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