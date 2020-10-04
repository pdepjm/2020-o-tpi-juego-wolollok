import wollok.game.*
import submarine.*
import obstaculos.*

object yellowSubmarine {
	
	method iniciar(){
		self.configurarJuego()
		self.agregarPersonajes()
		self.configurarTeclas()
		self.configurarAcciones()
		game.start()
	}
	
	method configurarJuego(){
		game.title("Yellow Submarine")
		game.width(50)
		game.height(50)
		game.boardGround("fondomar.png")
	}
	
	method agregarPersonajes(){
		game.addVisual(submarine)
		game.addVisual(bomba)
	}
	
	method configurarTeclas(){
		keyboard.up().onPressDo({ submarine.moverseA(submarine.position().up(1))})
		keyboard.down().onPressDo({ submarine.moverseA(submarine.position().down(1))})
		keyboard.left().onPressDo({ submarine.moverseA(submarine.position().left(1))})
		keyboard.right().onPressDo({ submarine.moverseA(submarine.position().right(1))})
	}
	
	method configurarAcciones(){
		
	}
	
}
