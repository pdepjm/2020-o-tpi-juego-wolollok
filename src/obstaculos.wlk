import wollok.game.*
import submarine.*
import movimientos.*


class Obstaculo{
	
	var property posicion = self.generarPosicionInicial()
	
	method generarPosicionInicial(){
		
		// calculo coordenadas aleatorias dentro la pantalla y lejos de los bordes
		const x = 1.randomUpTo(5)
		const y = 1.randomUpTo(5)
		// cambio a nueva posicion
		return game.at(x, y)
		 
	}
	
	method hacerDanio()
	
}


class Bomba inherits Obstaculo {

	var property image = "bomb.png"
	
	method teChocoElSubmarino(){
		submarine.perdio()
	}
}

class Pez inherits Obstaculo {
	
	var property movimiento
	var property image
	
	method teChocoElSubmarino() {
		submarine.perderUnaVida()
	}
	
	
}

class PezHorizontal inherits Pez {
	
	movimiento = lineaHorizontal
	image = "pezHorizontal.png" 	// No está en la carpeta assets
	
	method ejeY() = posicion.y()
	
	method moverseHorizontalmente(){
		movimiento.moverseUnaVez(self)
	}
}

class PezVertical inherits Pez {
	
	movimiento = lineaVertical
	image = "pezVertical.png" 		// No está en la carpeta assets
	
	method ejeX() = posicion.x()
	
	method moverseVerticalmente(){
		movimiento.moverseUnaVez(self)
	}
	
}