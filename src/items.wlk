import wollok.game.*
import submarine.*
import movimientos.*

class Escudo {
	
	method position() = game.at(7,7) 
	method image() = "escudoItem.png" 
	
	method teChocoElSubmarino() {
		submarine.activarEscudo()
		game.removeVisual(escudoItem)
	}
}

class BuffEscudo{
	
	var movimiento = encimaDelSubmarino

	method image() = "escudoActivado.png"
	
	method position() = movimiento.posicion()
}

const escudoItem = new Escudo()
const escudoBuff = new BuffEscudo()