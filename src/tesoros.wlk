import wollok.game.*
import yellowSubmarine.*
import submarino.*
import movimientos.*

object cofre {
	
	var imagen = "chest_closed.png"
	const posicion =  game.at(6,0)
	var tesoro = 3
	
	method image() = imagen
	method position() = posicion
	
	method teChocoElSubmarino(){
		imagen = "chest_open.png"
		submarino.agarrarMonedas(tesoro)	
		tesoro = 0
	}
}
	
class Moneda {
	var imagen = "Coin.png"
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	
	method image() = imagen
	method position() = posicion
	
	method teChocoElSubmarino(){
		submarino.agarrarMonedas(1)
		yellowSubmarine.borrarVisual(0,self)
	}
}

const moneda1 = new Moneda()

