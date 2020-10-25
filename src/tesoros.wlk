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

	var sonido_moneda = game.sound("grab_coin.mp3")
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	
	method image() = "Coin.png"
	method position() = posicion
	
	method teChocoElSubmarino(){
		//sonido_moneda.volume(0.05)
		//sonido_moneda.play()
		submarino.agarrarMonedas(1)
		self.agregarMoneda(new Moneda())
		self.borrarMoneda(self)
	}

	method moverse() { posicion = yellowSubmarine.ubicarAleatoriamente(self) }

	method agregarMoneda(unaMoneda){ 
		game.addVisual(unaMoneda)
		game.onTick(
			yellowSubmarine.dificultad().velocidadMoneda(),
			"mover la moneda" + unaMoneda.toString(),
			{ unaMoneda.moverse()})
	}

	method borrarMoneda (unaMoneda){
		game.removeTickEvent("mover la moneda" + unaMoneda.toString())
		game.removeVisual(unaMoneda)
	}
}



