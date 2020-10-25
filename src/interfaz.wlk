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