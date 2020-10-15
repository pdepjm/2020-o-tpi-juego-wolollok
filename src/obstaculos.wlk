import wollok.game.*
import submarino.*
import movimientos.*


class Obstaculo {	 
	
	method golpearSubmarino(poderGolpe){
		if(submarino.tieneEscudo())
			submarino.perderEscudo()
		else
			submarino.perderVidas(poderGolpe)
	}
}

class Piedra inherits Obstaculo{
	
}

class Bomba inherits Obstaculo {

	method image() = "bomb.png"
	
	method position() = game.at(5,5)
	
	method teChocoElSubmarino(){
		self.golpearSubmarino(2)
	}
}

const bomba = new Bomba()

/*
class Pez inherits Obstaculo {
	
	var property movimiento // puede ser vertical u horizontal
	
	method teChocoElSubmarino() {
		submarino.perderUnaVida()
	}
	
	
	method moverse(){
		movimiento.moverseUnaVez(self)
	}
	
	method estaEnBordeInferior() = self.posicion().x() == 0
	
	method estaEnBordeSuperior() = self.posicion().x() == 50	
}
*/