import wollok.game.*
import submarino.*
import obstaculos.*
import tesoros.*
import mercado.*
import items.*
import movimientos.*
import dificultades.*
import interfaz.*

object yellowSubmarine {
	var musica
	var flag = 0
	var property dificultad
	
	var property ancho_juego = 20
	var property alto_juego = 15
	
	var property ancho_agua = 19
	var property alto_agua = 12

	// piedras del juego
	const piedrasDelJuego = #{}
	// bombas del juego
	const bombasDelJuego = #{}

	method piedrasDelJuego() = piedrasDelJuego
	// este metodo agrega a la lista piedrasDelJuego cada piedra que se instancia 
	method agregarPiedra(unaPiedra) { piedrasDelJuego.add(unaPiedra) }

	method bombasDelJuego() = bombasDelJuego
	// este metodo agrega a la lista bombasDelJuego cada bomba que se instancia 
	method agregarBomba(unaBomba) { bombasDelJuego.add(unaBomba) }

	method iniciar(){
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarDificultad()
		self.configurarTeclas()
		self.configurarAcciones()
		self.configurarColisiones()
		// self.configurarMusica()
		game.start()
	}
	
	method configurarJuego(){
		game.title("Yellow Submarine")
		game.width(ancho_juego)
		game.height(alto_juego)
		game.boardGround("fondomarConOrilla.png")
		game.addVisual(indicadorDificultad)
		game.addVisual(barraVida)
		game.addVisual(billetera)
	}
	
	method agregarPersonajes(){
		game.addVisual(cofre)
		game.addVisual(mercado)
		game.addVisual(moneda)		
		game.addVisual(submarino)
		game.showAttributes(submarino)			
	}
	
	method configurarTeclas(){
		keyboard.up().onPressDo({ submarino.moverseA(submarino.position().up(1))})
		keyboard.down().onPressDo({ submarino.moverseA(submarino.position().down(1))})
		keyboard.left().onPressDo({	submarino.moverseA(submarino.position().left(1)) submarino.image("submarino-left.png")})
		keyboard.right().onPressDo({ submarino.moverseA(submarino.position().right(1)) submarino.image("submarino-right.png")})
		keyboard.m().onPressDo({ 
		
		if(flag==0){
			musica.pause()
			flag=1 }
		else{
			musica.resume()
			flag=0 }
				
		})
		
		//keyboard.b().onPressDo({ escudo.rodearSubmarino() })
	}
	
	method configurarAcciones(){
		game.onTick(moneda.tiempoCambioPosicion(), "mover la moneda", { moneda.moverse()} )
	}
	
	method configurarColisiones(){
		game.onCollideDo(submarino, { visualColisionado => visualColisionado.teChocoElSubmarino()})
	}
	
	method configurarMusica(){
		musica=game.sound("musica.mp3")
		musica.volume(0.05)
		game.schedule(500,{
			musica.shouldLoop(true)
			musica.play()		
		})
	}
	
	method borrarVisual(tiempo,objeto) { game.schedule(tiempo,{game.removeVisual(objeto)}) }
	
	// devuelve una posicion aleatoria que está vacia dentro del agua
	method ubicarAleatoriamente(objeto) {
		
		const x = 0.randomUpTo(ancho_agua)
		const y = 0.randomUpTo(alto_agua)
		
		var posicion = game.at(x,y)
		
		if(game.getObjectsIn(posicion).isEmpty()) // Si no hay nada en esa posicion
			return posicion
		else 
			return self.ubicarAleatoriamente(objeto)
	
	}

	method noSaleDelAgua(nuevaPosicion) {
		return (nuevaPosicion.x() >= 0 and
			    nuevaPosicion.x() <= ancho_agua and 
			    nuevaPosicion.y() >= 0 and 
			    nuevaPosicion.y() <= alto_agua)
	}
	
	method noChocaConPiedra(nuevaPosicion) = self.piedrasDelJuego().intersection(game.getObjectsIn(nuevaPosicion)).isEmpty() // Si no hay ninguna piedra en esa posicion
	
	method chocaConPiedra(nuevaPosicion) = not(self.noChocaConPiedra(nuevaPosicion))
	
	method noChocaConBomba(nuevaPosicion) = self.bombasDelJuego().intersection(game.getObjectsIn(nuevaPosicion)).isEmpty() // Si no hay ninguna bomba en esa posicion
	
	method chocaConBomba(nuevaPosicion) = not(self.noChocaConBomba(nuevaPosicion))
	
	method noChocaConBombaNiPiedra(nuevaPosicion) {
		return self.noChocaConBomba(nuevaPosicion) and self.noChocaConPiedra(nuevaPosicion)
	}

	method analizarDificultad() { dificultad.chequearDificultad() }

	// configura la dificultad inicial del juego en facil y carga esta dificultad
	method configurarDificultad() { 
		self.dificultad(new Facil()) 
		self.dificultad().generarCambios() 
	} 
	
}

