import wollok.game.*
import submarine.*

object bomba {
	var property image = "bomb.png"
	var property position = game.at(5,5)
	
	method teChocoElSubmarino(){
		submarine.perdio()
	}
}
