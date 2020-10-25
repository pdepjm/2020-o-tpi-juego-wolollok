import wollok.game.*
import yellowSubmarine.*
import submarino.*
import tesoros.*
import obstaculos.*
import movimientos.*

class Dificultad {
	
	method limiteMonedas()
	method aumentarDificultad()

	method chequearDificultad() {
		if(submarino.monedas() > self.limiteMonedas()){
			self.aumentarDificultad()
			yellowSubmarine.dificultad().generarCambios()	
		}
	}

}

/////////////////	DIFICULTAD FACIL	/////////////////

class Facil inherits Dificultad {

	override method limiteMonedas() = 3 
	method velocidadMoneda() = 10000
	method proximaDificultad() = new Media()

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

	method bombas() {
		// bombas

		return #{ 
			new Bomba(),
			new Bomba(),
			new Bomba(),
			new Bomba(),
			new Bomba(),
			new Bomba()
		}
	}

	method tiburones() {
		// tiburones
		return #{
			new Tiburon(movimiento = new Horizontal(), imagen = "tiburon_derecha.png", distancia = 3, velocidad = 100),
			new Tiburon(movimiento = new Vertical(), imagen = "tiburon_arriba.png", distancia = 2, velocidad = 100),
			new Tiburon(posicion = game.at(7,2), movimiento = new Horizontal(), imagen = "tiburon_derecha.png", distancia = 2, velocidad = 250)
		}
	}
	
	method generarCambios(){
		moneda.tiempoCambioPosicion(10000)

		self.piedras().forEach({unaPiedra =>
									game.addVisual(unaPiedra)
									yellowSubmarine.agregarPiedra(unaPiedra)})
		
		self.bombas().forEach({unaBomba =>  
									game.addVisual(unaBomba)
									yellowSubmarine.agregarBomba(unaBomba)}) 
			
		self.tiburones().forEach({unTiburon =>
									game.addVisual(unTiburon)
									game.onTick(unTiburon.velocidad(), "mover tiburon " + unTiburon.toString(), { unTiburon.moverse() }) })
	}

	override method aumentarDificultad() { yellowSubmarine.dificultad(self.proximaDificultad()) }

	method nombre() = "facil"
}

/////////////////	DIFICULTAD MEDIA	/////////////////

class Media inherits Dificultad {

	override method limiteMonedas() = 7 
	method velocidadMoneda() = 5000
	method proximaDificultad() = new Dificil()
	
	method bombas() {
			// bombas 
			return #{
				new Bomba(),
				new Bomba(),
				new Bomba()	
			}
		}

	method tiburones() {
		// tiburones
		return #{
			new Tiburon(movimiento = new Horizontal(), imagen = "tiburon_derecha.png", distancia = 4, velocidad = 50),
			new Tiburon(movimiento = new Vertical(), imagen = "tiburon_arriba.png", distancia = 7, velocidad = 50)
		}
	}

	method agregarPulpo(unPulpo) {
		game.addVisual(unPulpo)
		game.onTick(unPulpo.velocidad(), "mover pulpo " + unPulpo.toString(), { unPulpo.moverse() })
	}

	method generarCambios(){
		moneda.tiempoCambioPosicion(5000)
		game.removeTickEvent("mover la moneda")
		game.onTick(moneda.tiempoCambioPosicion(), "mover la moneda", { moneda.moverse()} )
		
		self.bombas().forEach({unaBomba =>  
									game.addVisual(unaBomba)
									yellowSubmarine.agregarBomba(unaBomba)}) 
			
		self.tiburones().forEach({unTiburon =>
									game.addVisual(unTiburon)
									game.onTick(unTiburon.velocidad(), "mover tiburon " + unTiburon.toString(), { unTiburon.moverse() }) })

		self.agregarPulpo(new Pulpo(velocidad = 2000))
		
		game.addVisual(iman)
		game.onTick(iman.frecuenciaAtraccion(), "atraccion iman dificultad media", { iman.atraerSubmarino()})
	}

	override method aumentarDificultad() { yellowSubmarine.dificultad(self.proximaDificultad()) }

	method nombre() = "media"
}

/////////////////	DIFICULTAD DIFICIL	/////////////////	

class Dificil inherits Dificultad {

	override method limiteMonedas() = 14
	method velocidadMoneda() = 1000

	override method chequearDificultad() {
		if(submarino.monedas() > self.limiteMonedas())
			submarino.ganar()
	}
	
	method bombas() {
		// bombas 
		return #{
			new Bomba(),
			new Bomba(),
			new Bomba()	
		}
	}

	method agregarPulpo(unPulpo) {
		game.addVisual(unPulpo)
		game.onTick(unPulpo.velocidad(), "mover pulpo " + unPulpo.toString(), { unPulpo.moverse() })
	}
	
	method generarCambios(){
		moneda.tiempoCambioPosicion(1000)
		game.removeTickEvent("mover la moneda")
		game.onTick(moneda.tiempoCambioPosicion(), "mover la moneda", { moneda.moverse()} )
		
		self.bombas().forEach({unaBomba =>  
									game.addVisual(unaBomba)
									yellowSubmarine.agregarBomba(unaBomba)}) 

		self.agregarPulpo(new Pulpo(velocidad = 1000))

		iman.frecuenciaAtraccion(1000)
		game.removeTickEvent("atraccion iman dificultad media")
		game.onTick(iman.frecuenciaAtraccion(), "atraccion iman dificultad dificil", { iman.atraerSubmarino()})
	}

	override method aumentarDificultad() {}

	method nombre() = "dificil"
}