import wollok.game.*
import yellowSubmarine.*
import submarino.*
import tesoros.*
import obstaculos.*
import movimientos.*
import interfaz.*

class Dificultad {
	
	method limiteMonedas()
	method bombas()
	method proximaDificultad()

	method chequearDificultad() {
		if(submarino.monedas() > self.limiteMonedas()){
			self.aumentarDificultad()
			yellowSubmarine.dificultad().generarCambios()	
		}
	}

	method aumentarDificultad() { yellowSubmarine.dificultad(self.proximaDificultad()) }

	method generarCambios(){	
		self.bombas().forEach({unaBomba =>  
									game.addVisual(unaBomba)
									yellowSubmarine.agregarBomba(unaBomba)}) 
	}

	method agregarPulpo(unPulpo) {
		game.addVisual(unPulpo)
		game.onTick(unPulpo.velocidad(), "mover pulpo " + unPulpo.toString(), { unPulpo.moverse() })
	}

}

/////////////////	DIFICULTAD FACIL	/////////////////

class Facil inherits Dificultad {

	override method limiteMonedas() = 3 
	method velocidadMoneda() = 10000
	override method proximaDificultad() = new Media()

	method piedras() {
		// piedras facil
		return #{
			new Piedra(posicion = game.at(0,2),imagen = "Stone_6_der.png"),
			new Piedra(posicion = game.at(0,4),imagen = "Stone_6_der.png"),
			new Piedra(posicion = game.at(0,5),imagen = "Stone_6_der.png"),
			new Piedra(posicion = game.at(0,7),imagen = "Stone_6_der.png"),
			new Piedra(posicion = game.at(19,3),imagen = "Stone_6_izq.png"),
			new Piedra(posicion = game.at(19,5),imagen = "Stone_6_izq.png"),
			new Piedra(posicion = game.at(19,6),imagen = "Stone_6_izq.png"),
			new Piedra(posicion = game.at(19,1),imagen = "Stone_6_izq.png"),
			new Piedra(posicion = game.at(5,0),imagen = "Stone_6.png"),
			new Piedra(posicion = game.at(7,0),imagen = "Stone_6.png"),
			new Piedra(posicion = game.at(5,1),imagen = "Stone_6.png"),
			new Piedra(posicion = game.at(7,1),imagen = "Stone_6.png")
		}
	}

	override method bombas() {
		// bombas
		return #{new Bomba(),new Bomba(),new Bomba(),new Bomba(),new Bomba(),new Bomba()}
	}

	method tiburones() {
		// tiburones
		return #{
			new Tiburon(movimiento = new MovimientoRecto(sentido = derecha), distancia = 3, velocidad = 100),
			new Tiburon(movimiento = new MovimientoRecto(sentido = arriba), distancia = 2, velocidad = 100),
			new Tiburon(posicion = game.at(5,2), movimiento = new MovimientoRecto(sentido = derecha), distancia = 2, velocidad = 250)
		}
	}
	
	override method generarCambios(){
		super()

		self.piedras().forEach({unaPiedra =>
									game.addVisual(unaPiedra)
									yellowSubmarine.agregarPiedra(unaPiedra)})
			
		self.tiburones().forEach({unTiburon =>
									game.addVisual(unTiburon)
									game.onTick(unTiburon.velocidad(), "mover tiburon " + unTiburon.toString(), { unTiburon.moverse() }) })
	}

	method nombre() = "facil"
}

/////////////////	DIFICULTAD MEDIA	/////////////////

class Media inherits Dificultad {

	override method limiteMonedas() = 7 
	method velocidadMoneda() = 5000
	override method proximaDificultad() = new Dificil()
	
	override method bombas() {
		// bombas
		return #{new Bomba(),new Bomba(),new Bomba()}
	}

	method tiburones() {
		// tiburones
		return #{
			new Tiburon(movimiento = new MovimientoRecto(sentido = derecha), distancia = 4, velocidad = 50),
			new Tiburon(movimiento = new MovimientoRecto(sentido = arriba), distancia = 7, velocidad = 50)
		}
	}

	override method generarCambios(){
		super()
			
		self.tiburones().forEach({unTiburon =>
									game.addVisual(unTiburon)
									game.onTick(unTiburon.velocidad(), "mover tiburon " + unTiburon.toString(), { unTiburon.moverse() }) })

		self.agregarPulpo(new Pulpo(velocidad = 2000))
		
		game.addVisual(iman)
		game.onTick(iman.frecuenciaAtraccion(), "atraccion iman dificultad media", { iman.atraerSubmarino()})
	}

	method nombre() = "media"
}

/////////////////	DIFICULTAD DIFICIL	/////////////////	

class Dificil inherits Dificultad {

	override method limiteMonedas() = 14
	method velocidadMoneda() = 1000
	override method proximaDificultad(){}

	override method chequearDificultad() {
		if(submarino.monedas() > self.limiteMonedas())
			yellowSubmarine.finJuegoPor(victoria)
	}
	
	override method bombas() {
		// bombas
		return #{new Bomba(),new Bomba(),new Bomba()}
	}
	
	override method generarCambios(){
		super()

		self.agregarPulpo(new Pulpo(velocidad = 1000))

		iman.frecuenciaAtraccion(1000)
		game.removeTickEvent("atraccion iman dificultad media")
		game.onTick(iman.frecuenciaAtraccion(), "atraccion iman dificultad dificil", { iman.atraerSubmarino() })
	}

	override method aumentarDificultad() {}

	method nombre() = "dificil"
}