import wollok.game.*
import submarino.*
import obstaculos.*
import tesoros.*
import mercado.*
import items.*
import movimientos.*

object yellowSubmarine {
	var musica
	var flag = 0
	var dificultad = facil
	
	var property ancho_juego = 20
	var property alto_juego = 15
	
	var property ancho_agua = 19
	var property alto_agua = 12
	
	method iniciar(){
		self.configurarJuego()
		self.agregarPersonajes()
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
		
		bombas.forEach({unaBomba =>  game.addVisual(unaBomba)})
		
		piedras.forEach({unaPiedra =>  game.addVisual(unaPiedra)})
		
		tiburones.forEach({unTiburon =>  game.addVisual(unTiburon)})

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
		
		game.onTick(500, "mover tiburon 1", { tiburon1.moverse() })
		game.onTick(500, "mover tiburon 2", { tiburon2.moverse() })
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

object facil {
	var flagCarga = false
	
	method cargar() {
		if(!flagCarga){
			self.generarCambios()
			flagCarga = true
		}
	}
	
	method generarCambios(){
		game.say(submarino, "FACIL")
		moneda.tiempoCambioPosicion(10000)
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
		game.say(submarino, "MEDIA")
		moneda.tiempoCambioPosicion(5000)
		game.removeTickEvent("mover la moneda")
		game.onTick(moneda.tiempoCambioPosicion(), "mover la moneda", { moneda.moverse()} )
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
		game.say(submarino, "DIFICIL")
		moneda.tiempoCambioPosicion(1000)
		game.removeTickEvent("mover la moneda")
		game.onTick(moneda.tiempoCambioPosicion(), "mover la moneda", { moneda.moverse()} )
	}
}
	 
// escudo
const escudoItem = new Escudo()
const escudoBuff = new BuffEscudo()

//////////////////// OBSTACULOS ////////////////////

// Dificultad FACIL

// bombas
const bomba1 = new Bomba(posicion = game.at(5,5))
const bomba2 = new Bomba(posicion = game.at(10,5))
const bomba3 = new Bomba(posicion = game.at(6,3))

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
const tiburon1 = new Tiburon(posicion = game.at(8,2), movimiento = horizontal, imagen = "tiburon_derecha.png")
const tiburon2 = new Tiburon(posicion = game.at(12,5), movimiento = vertical, imagen = "tiburon_arriba.png")

// colecciones
const piedras = [piedra1,piedra2,piedra3,piedra4,piedra5,piedra6,piedra7,piedra8,piedra9,piedra10,piedra11,piedra12]
	
const bombas = [bomba1,bomba2,bomba3]

const tiburones = [tiburon1, tiburon2]
	
