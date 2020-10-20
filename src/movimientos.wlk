import wollok.game.*
import yellowSubmarine.*
import submarino.*
import obstaculos.*

object aleatorio { method posicion() = yellowSubmarine.ubicarAleatoriamente(self) }

object encimaDelSubmarino { method posicion() = submarino.position() }

class Horizontal {
	
	var contador = 0
	var sentido = 1
	
	method moverseUnaVez(unObjeto) {
		
		var posicionAnalizar
		
		if(sentido == 1)
			posicionAnalizar = unObjeto.position().left(1)
		else 
			posicionAnalizar = unObjeto.position().right(1)
		
		if( contador < unObjeto.distancia() and 
			yellowSubmarine.noChocaConBombaNiPiedra(posicionAnalizar) and 
			yellowSubmarine.noSaleDelAgua(posicionAnalizar)
		){
			
			if(sentido == 1){
				contador++
				unObjeto.cambiarImagenIzquierda()
				return self.moverIzquierda(unObjeto)
			}
			else{
				contador++
				unObjeto.cambiarImagenDerecha()
				return self.moverDerecha(unObjeto)
			}	
		}
		else
			return self.cambiarSentido(unObjeto)		
	}		
	
	method cambiarSentido(unObjeto) {
		sentido = sentido * (-1)
		contador = 0
		return unObjeto.position()
	}
	
	method moverIzquierda(unObjeto) {
			return unObjeto.position().left(1)
	}
	
	method moverDerecha(unObjeto) {
			return unObjeto.position().right(1)
	}
	
}

class Vertical {

	var contador = 0
	var sentido = 1
	
	method moverseUnaVez(unObjeto) {
		
		var posicionAnalizar
		
		if(sentido == 1)
			posicionAnalizar = unObjeto.position().up(1)
		else 
			posicionAnalizar = unObjeto.position().down(1)
		
		if(contador < unObjeto.distancia() and
			yellowSubmarine.noChocaConBombaNiPiedra(posicionAnalizar) and 
			yellowSubmarine.noSaleDelAgua(posicionAnalizar)){
			
			if(sentido == 1){
				contador++
				unObjeto.cambiarImagenArriba()
				return self.moverArriba(unObjeto)
			}
			else{
				contador++
				unObjeto.cambiarImagenAbajo()
				return self.moverAbajo(unObjeto)
			}	
		}
			
		else
			return self.cambiarSentido(unObjeto)				
	}
	
	method cambiarSentido(unObjeto) {
		sentido = sentido * (-1)
		contador = 0
		return unObjeto.position()
	}			
	
	method moverArriba(unObjeto) {	
			return unObjeto.position().up(1)
	}
	
	method moverAbajo(unObjeto) {
			return unObjeto.position().down(1)
	}
	
}