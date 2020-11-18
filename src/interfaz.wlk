import wollok.game.*
import yellowSubmarine.*
import submarino.*

object barraVida{
	method image() = "vidas-" + submarino.vidas() + ".png"
	method position() = game.at(1,yellowSubmarine.alto_juego()-0.5)
	
}

object billetera{
	method image() ="coin-" + submarino.monedas() +".png"
	method position() = game.at(yellowSubmarine.ancho_juego()-1.5,yellowSubmarine.alto_juego()-0.5)
}

object indicadorDificultad{
	method image() = yellowSubmarine.dificultad().nombre().toString()+".png"
	method position() = game.at(yellowSubmarine.ancho_juego()/2,yellowSubmarine.alto_juego()-0.5)
}

object menuMercado{
	var property image= "Menu_mercado.jpg"
	method position()=game.origin()

	method error(){
		self.image("Menu_mercado_error.jpg")
		game.schedule(1000,{self.image("Menu_Mercado.jpg")})
	}
}

object victoria{
	var property image= "victoria.png"
	const victoriaSound = game.sound("victoria.mp3")
	method position()=game.at(7,7.5)
	method musica(){
		victoriaSound.volume(0.3)
		victoriaSound.shouldLoop(true)
		victoriaSound.play()	
		}
}

object derrota{
	var property image= "eliminado.png"
	const derrotaSound = game.sound("eliminado.mp3")
	method position()=game.at(-3,0)
	method musica(){
		derrotaSound.volume(0.3)
		derrotaSound.shouldLoop(true)
		derrotaSound.play()
		}
}

object menuPrincipal{
	var property image= "menuPrincipal.png"
	method position()=game.origin()
}