import wollok.game.*
import yellowSubmarine.*
import submarino.*
import movimientos.*

class Escudo {
	
	method position() = game.at(7,7) 
	method image() = "escudoItem.png" 
	
	method teChocoElSubmarino() {
		submarino.activarEscudo()
		yellowSubmarine.borrarVisual(0,self)
	}
}

class BuffEscudo{
	
	var movimiento = encimaDelSubmarino

	method image() = "escudoActivado.png"
	
	method position() = movimiento.posicion()
}

const escudoItem = new Escudo()
const escudoBuff = new BuffEscudo()