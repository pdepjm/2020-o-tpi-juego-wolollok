import wollok.game.*
import submarine.*
import movimientos.*

object cofre {
	var property image = "æhest_closed.png"
	var property position = game.at(8,0)
	
	method teChocoElSubmarino(){
		image = "æhest_open.png"	
	}
}
	
object gema {
	var property image = "Coin.png"
	var movimiento = inicial
	
	method position() = movimiento.posicion()
	
	method teChocoElSubmarino(){
		self.tesoroRecogido()
	}

	method tesoroRecogido(){
		image = "Coin_chico.png"
		movimiento = recogido
	}
}

