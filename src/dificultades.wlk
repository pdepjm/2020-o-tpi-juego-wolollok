import wollok.game.*
import yellowSubmarine.*
import submarino.*
import tesoros.*
import obstaculos.*


////////////////// DIFICULTADES //////////////////

object facil {
	var flagCarga = false
	
	method cargar() {
		if(!flagCarga){
			self.generarCambios()
			flagCarga = true
		}
	}
	
	method generarCambios(){
		//game.say(submarino, "FACIL")
		moneda.tiempoCambioPosicion(10000)
		
		piedras.forEach({unaPiedra =>  game.addVisual(unaPiedra)})
		
		bombasFacil.forEach({unaBomba =>  
			game.addVisual(unaBomba)
			bombas.add(unaBomba)}) 
			
		tiburonesFacil.forEach({unTiburon =>  
			game.addVisual(unTiburon)
			tiburones.add(unTiburon)})

		game.onTick(tiburon1.velocidad(), "mover tiburon 1", { tiburon1.moverse() })
		game.onTick(tiburon2.velocidad(), "mover tiburon 2", { tiburon2.moverse() })
		game.onTick(tiburon3.velocidad(), "mover tiburon 3", { tiburon3.moverse() })
	}
}

object media {
	var flagCarga = false
	
	method cargar() {
		if(!flagCarga){
			self.generarCambios()
			flagCarga = true
		}
	}
	
	method generarCambios(){
		//game.say(submarino, "MEDIA")
		moneda.tiempoCambioPosicion(5000)
		game.removeTickEvent("mover la moneda")
		game.onTick(moneda.tiempoCambioPosicion(), "mover la moneda", { moneda.moverse()} )
		
		bombasMedia.forEach({unaBomba =>  
			game.addVisual(unaBomba)
			bombas.add(unaBomba)}) 
			
		tiburonesMedia.forEach({unTiburon =>  
			game.addVisual(unTiburon)
			tiburones.add(unTiburon)})

		game.addVisual(pulpo1)
		game.onTick(pulpo1.velocidad(), "mover pulpo 1", { pulpo1.moverse() })
		
		game.addVisual(iman)
		game.onTick(iman.frecuenciaAtraccion(), "atraccion iman dificultad media", { iman.atraerSubmarino()})

		game.onTick(tiburon4.velocidad(), "mover tiburon 4", { tiburon4.moverse() })
		game.onTick(tiburon5.velocidad(), "mover tiburon 5", { tiburon5.moverse() })
	}
}

object dificil {
	var flagCarga = false
	
	method cargar() {
		if(!flagCarga){
			self.generarCambios()
			flagCarga = true
		}
	}
	
	method generarCambios(){
		//game.say(submarino, "DIFICIL")
		moneda.tiempoCambioPosicion(1000)
		game.removeTickEvent("mover la moneda")
		game.onTick(moneda.tiempoCambioPosicion(), "mover la moneda", { moneda.moverse()} )
		
		bombasDificil.forEach({unaBomba =>  
			game.addVisual(unaBomba)
			bombas.add(unaBomba)})


		iman.frecuenciaAtraccion(1000)
		game.removeTickEvent("atraccion iman dificultad media")
		game.onTick(iman.frecuenciaAtraccion(), "atraccion iman dificultad dificil", { iman.atraerSubmarino()})

		game.addVisual(pulpo2)
		game.onTick(pulpo2.velocidad(), "mover pulpo 2", { pulpo2.moverse() })
	}
}
