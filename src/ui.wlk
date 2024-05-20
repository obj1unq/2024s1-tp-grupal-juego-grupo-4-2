import wollok.game.*
import froggi.*

object puntosUI {
	var property position = game.at(10, 12)
	var puntosDe

//	method image(){
//		return ""
//	}
//	
	method text() {
		return "" + self.puntosDe()
	}

	method puntosDe() {
		return puntosDe.puntos()
	}

	method puntosDe(_puntosDe) {
		puntosDe = _puntosDe
	}

}

