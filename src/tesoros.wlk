import wollok.game.*
import submarino.*
import movimientos.*

object cofre {
	var property image = "æhest_closed.png"
	var property position = game.at(8,0)
	
	method teChocoElSubmarino(){
		image = "æhest_open.png"	
	}
}
	
object moneda {
	var property image = "Coin.png"
	var property movimiento = inicial
	
	method position() = movimiento.posicion()
	
	method teChocoElSubmarino(){
		submarino.agregarMoneda()
	}

}

