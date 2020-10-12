import wollok.game.*
import submarine.*
import obstaculos.*
import tesoros.*
import mercado.*

object yellowSubmarine {
	var musica
	var flag=0
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
		game.width(20)
		game.height(15)
		game.boardGround("fondomarConOrilla.png")
	}
	
	method agregarPersonajes(){
		game.addVisual(bomba)
		game.addVisual(cofre)
		game.addVisual(gema)
		game.addVisual(mercado)
		game.addVisual(submarine)
	}
	
	method configurarTeclas(){
		keyboard.up().onPressDo({ submarine.moverseA(submarine.position().up(1))})
		keyboard.down().onPressDo({ submarine.moverseA(submarine.position().down(1))})
		keyboard.left().onPressDo({	submarine.moverseA(submarine.position().left(1)) submarine.image("submarino-left.png")})
		keyboard.right().onPressDo({ submarine.moverseA(submarine.position().right(1)) submarine.image("submarino-right.png")})
		keyboard.m().onPressDo({ 
			if(flag==0)
				{musica.pause()
				 flag=1
				}
			else
				{
				 musica.resume()
				 flag=0
				}
		})
	}
	
	method configurarAcciones(){
		
	}
	
	method configurarColisiones(){
		game.onCollideDo(submarine, { visualColisionado => visualColisionado.teChocoElSubmarino()})
	}
	
	method configurarMusica(){
		musica=game.sound("musica.mp3")
		game.schedule(500,{
			musica.shouldLoop(true)
			musica.play()		
		})
	}
}
