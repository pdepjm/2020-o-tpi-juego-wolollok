import wollok.game.*
import submarino.*

object mercado {
	const precioVida=2
	const precioEscudo=3
	var property image = "Boat Shop.png"
	var property position = game.at(1,12)
	method teChocoElSubmarino(){
		submarino.sobreElMercado(true)
	}
	
	method atenderSubmarino(){
			game.addVisual(menu)
			keyboard.v().onPressDo({self.venderVida()})
			keyboard.e().onPressDo({self.venderEscudo()})
}
	method precioVida()=precioVida
	method precioEscudo()=precioEscudo
	method venderVida(){
		if(submarino.monedas()<precioVida)
			menu.error()
		else
			submarino.comprarVida()
	}
	method venderEscudo(){
		if(submarino.monedas()>=precioEscudo)
			submarino.comprarEscudo()
		else
			menu.error()
	}
}

object menu{
	var property image= "Menu_mercado.jpg"
	method position()=game.origin()

	method error(){
		self.image("Menu_mercado_error.jpg")
		game.schedule(1000,{self.image("Menu_Mercado.jpg")})
	}
}
