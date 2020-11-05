import wollok.game.*
import yellowSubmarine.*
import submarino.*
import movimientos.*

object cofre {
	const sonido_tesoro = game.sound("relic.mp3")
	var imagen = "chest_closed.png"
	const posicion =  game.at(6,0)
	var tesoro = 3
	
	method image() = imagen
	method position() = posicion
	
	method teChocoElSubmarino(){
		if(tesoro>0){
			self.ruido()
			imagen = "chest_open.png"
			submarino.agarrarMonedas(tesoro)	
			tesoro = 0
		}
	}
	method ruido(){
			sonido_tesoro.volume(0.4)
			sonido_tesoro.shouldLoop(true)
			sonido_tesoro.play()
			game.schedule(1000,{sonido_tesoro.stop()})
	}
}


class Moneda {

	const sonido_moneda = game.sound("coin.mp3")
	var posicion = yellowSubmarine.ubicarAleatoriamente(self)
	
	method image() = "Coin.png"
	method position() = posicion
	
	method teChocoElSubmarino(){
		self.ruido()
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
	
	method ruido(){
		if(sonido_moneda.played()){
			sonido_moneda.resume()
			game.schedule(1000,{sonido_moneda.pause()})}
		else{
			sonido_moneda.volume(0.04)
			sonido_moneda.shouldLoop(true)
			sonido_moneda.play()
			game.schedule(1000,{sonido_moneda.pause()})
		}
	}
}



