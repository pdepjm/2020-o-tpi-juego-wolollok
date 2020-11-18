import wollok.game.*
import submarino.*
import interfaz.*

object mercado {
	const precioVida=2
	const precioEscudo=3
	var property image = "Boat Shop.png"
	var property position = game.at(1,12)
	method teChocoElSubmarino(){
		submarino.sobreElMercado(true)
	}
	method precioVida()=precioVida
	method precioEscudo()=precioEscudo
	method venderVida(){
		if(submarino.monedas()<precioVida)
			menuMercado.error()
		else
			submarino.comprarVida()
	}
	method venderEscudo(){
		if(submarino.monedas()>=precioEscudo)
			submarino.comprarEscudo()
		else
			menuMercado.error()
	}
}
