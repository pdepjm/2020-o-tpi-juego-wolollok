import wollok.game.*
import yellowSubmarine.*
import submarino.*
import obstaculos.*

object aleatorio { method posicion() = yellowSubmarine.ubicarAleatoriamente(self) }

object encimaDelSubmarino { method posicion() = submarino.position() }

object noAgarrado { method posicion() = game.at(-20,-20)}

// sentidos
object arriba {
	method imagen() = "arriba"

	method proximaPosicion(unObjeto) = unObjeto.position().up(1)

	method sentidoOpuesto() = abajo
}

object abajo {
	method imagen() = "abajo"	

	method proximaPosicion(unObjeto) = unObjeto.position().down(1)

	method sentidoOpuesto() = arriba
}

object derecha {
	method imagen() = "derecha"	

	method proximaPosicion(unObjeto) = unObjeto.position().right(1)

	method sentidoOpuesto() = izquierda
}

object izquierda {
	method imagen() = "izquierda"	

	method proximaPosicion(unObjeto) = unObjeto.position().left(1)

	method sentidoOpuesto() = derecha
}

class MovimientoRecto {
	var pasos = 0
	var property sentido
	
	method imagen() = sentido.imagen()

	method proximaPosicion(unObjeto) = sentido.proximaPosicion(unObjeto)

	method sePuedeMoverA(nuevaPosicion) = yellowSubmarine.noChocaConBombaNiPiedra(nuevaPosicion) and yellowSubmarine.noSaleDelAgua(nuevaPosicion)
	
	method puedeDarMasPasos(unObjeto) = pasos < unObjeto.distancia()

	method moverseUnaVez(unObjeto) {	
			
		if( self.puedeDarMasPasos(unObjeto) and self.sePuedeMoverA(self.proximaPosicion(unObjeto)) ){
			pasos++
			return sentido.proximaPosicion(unObjeto)
		}
		else return self.cambiarSentido(unObjeto)		
	}		

	method cambiarSentido(unObjeto) {
		self.sentido(self.sentido().sentidoOpuesto())
		pasos = 0
		return unObjeto.position()
	}
	
}