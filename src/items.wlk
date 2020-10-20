import wollok.game.*
import yellowSubmarine.*
import submarino.*
import movimientos.*

object escudo{
	
	var movimiento = noAgarrado

	method image() = "escudoActivado.png"
	
	method position() = movimiento.posicion()
	
	method rodearSubmarino(){
		movimiento = encimaDelSubmarino
		submarino.activarEscudo()
	}
	
	method teChocoElSubmarino(){}
}

