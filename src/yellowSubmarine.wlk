import wollok.game.*
import submarine.*
import obstaculos.*
import tesoros.*

object yellowSubmarine {
	
	method iniciar(){
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		self.configurarColisiones()
		game.start()
	}
	
	method configurarJuego(){
		game.title("Yellow Submarine")
		game.width(15)
		game.height(10)
		game.boardGround("fondomar.png")
	}
	
	method agregarPersonajes(){
		game.addVisual(bomba)
		game.addVisual(cofre)
		game.addVisual(gema)
		game.addVisual(submarine)
	}
	
	method configurarTeclas(){
		keyboard.up().onPressDo({ submarine.moverseA(submarine.position().up(1))})
		keyboard.down().onPressDo({ submarine.moverseA(submarine.position().down(1))})
		keyboard.left().onPressDo({ submarine.moverseA(submarine.position().left(1))})
		keyboard.right().onPressDo({ submarine.moverseA(submarine.position().right(1))})
	}
	
	method configurarAcciones(){
		
	}
	
	method configurarColisiones(){
		game.onCollideDo(submarine, { visualColisionado => visualColisionado.teChocoElSubmarino()})
	}
}
