import wollok.game.*
import yellowSubmarine.*
import submarino.*
import movimientos.*

class Escudo {
	
	method position() = game.at(2,10) 
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

