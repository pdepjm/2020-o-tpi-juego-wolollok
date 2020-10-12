import wollok.game.*
import submarine.*
import obstaculos.*
import tesoros.*

object aleatorio {

	var posicion = game.at(8, 8)

	method posicion() = posicion

	method nuevaPosicion() {
		// calculo coordenadas aleatorias dentro la pantalla
		const x = 0.randomUpTo(game.width())
		const y = 0.randomUpTo(game.height())
		// cambio a nueva posicion
		posicion = game.at(x, y)
	}
}

object inicial {
	
	method posicion() = game.at(8,0)
}

object recogido {
	
	method posicion() = submarine.position().left(1)

}

object lineaHorizontal{
	
	method moverseUnaVez(pez){
		
	}
	
}

object lineaVertical{
	
	method moverseUnaVez(pez){
	
	}
	
}