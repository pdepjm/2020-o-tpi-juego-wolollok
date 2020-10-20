import wollok.game.*
import yellowSubmarine.*
import submarino.*
import obstaculos.*

object aleatorio {

	method posicion() = yellowSubmarine.ubicarAleatoriamente(self)
}

object encimaDelSubmarino {
	
	method posicion() = submarino.position()
	
}

object horizontal {
	
	var contador = 0
	var sentido = 1
	
	method moverseUnaVez(tiburon) {
		
		if(contador <= 3){
			
			if(sentido == 1){
				tiburon.image("tiburon_izquierda.png")
				contador++
				return self.moverIzquierda(tiburon)
			}
			else{
				tiburon.image("tiburon_derecha.png")
				contador++
				return self.moverDerecha(tiburon)
			}	
		}
			
		else{
			
			sentido = sentido * (-1)
			contador = 0
			return tiburon.position()
		}			
	}			
	
	method moverIzquierda(tiburon) {
		return tiburon.position().left(1)
	}
	
	method moverDerecha(tiburon) {
		return tiburon.position().right(1)
	}
	
}

object vertical {
	
	var contador = 0
	var sentido = 1
	
	method moverseUnaVez(tiburon) {
		
		if(contador <= 3){
			
			if(sentido == 1){
				tiburon.image("tiburon_arriba.png")
				contador++
				return self.moverArriba(tiburon)
			}
			else{
				tiburon.image("tiburon_abajo.png")
				contador++
				return self.moverAbajo(tiburon)
			}	
		}
			
		else{
			
			sentido = sentido * (-1)
			contador = 0
			return tiburon.position()
		}			
	}			
	
	method moverArriba(tiburon) {
		return tiburon.position().up(1)
	}
	
	method moverAbajo(tiburon) {
		return tiburon.position().down(1)
	}
	
}