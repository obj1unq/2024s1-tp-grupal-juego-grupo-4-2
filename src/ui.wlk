import wollok.game.*
import froggi.*

object puntosUI {
	var property position = game.at(18, 12)
	var puntosDe

	method text() {
		return "PUNTOS TOTALES: " + self.puntosDe() + "   "
	}
	
	method textColor() {
		return "0D0EC6FF"
	}

	method puntosDe() {
		return puntosDe.puntos()
	}

	method puntosDe(personaje) {
		puntosDe = personaje
	}
	
	method colision(personaje){
		
	}

}

object vidasUI {
	var property position = game.at(0, 12)
	var vidasDe

	method text() {
		return "   VIDAS: " + self.vidasDe()
	}
	
	method textColor() {
		return "E70E0EFF"
	}

	method vidasDe() {
		return vidasDe.vida()
	}

	method vidasDe(personaje) {
		vidasDe = personaje
	}
	
	method colision(personaje){
		
	}

}


