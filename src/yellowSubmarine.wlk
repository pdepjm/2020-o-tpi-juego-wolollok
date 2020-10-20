import wollok.game.*
import submarino.*
import obstaculos.*
import tesoros.*
import mercado.*
import items.*
import movimientos.*
import dificultades.*

object yellowSubmarine {
	var musica
	var flag = 0
	var dificultad
	
	var property ancho_juego = 20
	var property alto_juego = 15
	
	var property ancho_agua = 19
	var property alto_agua = 12
	
	method iniciar(){
		self.configurarJuego()
		self.agregarPersonajes()
		self.actualizarDificultad()
		self.configurarTeclas()
		self.configurarAcciones()
		self.configurarColisiones()
		self.configurarMusica()
		game.start()
	}
	
	method configurarJuego(){
		game.title("Yellow Submarine")
		game.width(ancho_juego)
		game.height(alto_juego)
		game.boardGround("fondomarConOrilla.png")
	}
	
	method agregarPersonajes(){
		game.addVisual(cofre)
		game.addVisual(mercado)
		game.addVisual(escudoItem)

		game.addVisual(moneda)
		game.showAttributes(moneda)		
		
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
	
	method noChocaConPiedra(nuevaPosicion) = piedras.intersection(game.getObjectsIn(nuevaPosicion)).isEmpty() // Si no hay ninguna piedra en esa posicion
	
	method chocaConPiedra(nuevaPosicion) = not(self.noChocaConPiedra(nuevaPosicion))
	
	method noChocaConBomba(nuevaPosicion) = bombas.intersection(game.getObjectsIn(nuevaPosicion)).isEmpty() // Si no hay ninguna bomba en esa posicion
	
	method chocaConBomba(nuevaPosicion) = not(self.noChocaConBomba(nuevaPosicion))
	
	method noChocaConBombaNiPiedra(nuevaPosicion) {
		return self.noChocaConBomba(nuevaPosicion) and self.noChocaConPiedra(nuevaPosicion)
	}
	
	method actualizarDificultad() {
		if(submarino.monedas() <= 3)
			dificultad = facil
		else if(submarino.monedas() <= 7)
			dificultad = media
		else if(submarino.monedas() <= 14)
			dificultad = dificil
		else
			submarino.ganar()
			
		dificultad.cargar()
	}
	
	method dificultad() = dificultad
}
	 
// escudo
const escudoItem = new Escudo()
const escudoBuff = new BuffEscudo()

//////////////////// OBSTACULOS ////////////////////

// colecciones
const piedras = #{piedra1,piedra2,piedra3,piedra4,piedra5,piedra6,piedra7,piedra8,piedra9,piedra10,piedra11,piedra12}
	
const bombas = #{}

const tiburones = #{}

// Obstaculos dificultad Facil

const bombasFacil = #{bomba1,bomba2,bomba3,bomba4,bomba5,bomba6}
const tiburonesFacil = #{tiburon1,tiburon2,tiburon3}

// bombas

const bomba1 = new Bomba()
const bomba2 = new Bomba()
const bomba3 = new Bomba()
const bomba4 = new Bomba()
const bomba5 = new Bomba()
const bomba6 = new Bomba()

// piedras
const piedra1 = new Piedra(posicion = game.at(0,2),imagen = "Stone_6.png")
const piedra2 = new Piedra(posicion = game.at(0,4),imagen = "Stone_6.png")
const piedra3 = new Piedra(posicion = game.at(0,5),imagen = "Stone_6.png")
const piedra4 = new Piedra(posicion = game.at(0,7),imagen = "Stone_6.png")

const piedra5 = new Piedra(posicion = game.at(19,3),imagen = "Stone_6.png")
const piedra6 = new Piedra(posicion = game.at(19,5),imagen = "Stone_6.png")
const piedra7 = new Piedra(posicion = game.at(19,6),imagen = "Stone_6.png")
const piedra8 = new Piedra(posicion = game.at(19,1),imagen = "Stone_6.png")

const piedra9 = new Piedra(posicion = game.at(5,0),imagen = "Stone_6.png")
const piedra10 = new Piedra(posicion = game.at(7,0),imagen = "Stone_6.png")
const piedra11 = new Piedra(posicion = game.at(5,1),imagen = "Stone_6.png")
const piedra12 = new Piedra(posicion = game.at(7,1),imagen = "Stone_6.png")

// tiburones
const tiburon1 = new Tiburon(movimiento = new Horizontal(), imagen = "tiburon_derecha.png", distancia = 3, velocidad = 100)
const tiburon2 = new Tiburon(movimiento = new Vertical(), imagen = "tiburon_arriba.png", distancia = 2, velocidad = 100)
const tiburon3 = new Tiburon(posicion = game.at(7,2), movimiento = new Horizontal(), imagen = "tiburon_derecha.png", distancia = 2, velocidad = 250) // Cuida el cofre



// Obstaculos dificultad Media

const bombasMedia = #{bomba7,bomba8,bomba9}
const tiburonesMedia = #{tiburon4,tiburon5}

// bombas 

const bomba7 = new Bomba()
const bomba8 = new Bomba()
const bomba9 = new Bomba()

// tiburones

const tiburon4 = new Tiburon(movimiento = new Horizontal(), imagen = "tiburon_derecha.png", distancia = 4, velocidad = 50)
const tiburon5 = new Tiburon(movimiento = new Vertical(), imagen = "tiburon_arriba.png", distancia = 7, velocidad = 50)

// pulpos 

// iman



// Obstaculos dificultad Media

const bombasDificil = #{bomba10,bomba11,bomba12} 

// bombas 

const bomba10 = new Bomba()
const bomba11 = new Bomba()
const bomba12 = new Bomba()

// pulpo

// cambiar fuerza del iman

