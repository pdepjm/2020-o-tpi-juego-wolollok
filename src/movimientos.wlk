import wollok.game.*
import submarino.*
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

object encimaDelSubmarino {
	
	method posicion() = submarino.position()
	
}

object horizontal {
	
}

object vertical {
	
}