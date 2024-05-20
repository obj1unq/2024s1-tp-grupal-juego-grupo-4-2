import wollok.game.*
import froggi.*

object puntosUI {
	var property position = game.at(10, 12)
	var puntosDe

	method text() {
		return "" + self.puntosDe()
	}
	
	method textColor() {
		return "0D0EC6FF"
	}

	method puntosDe() {
		return puntosDe.puntos()
	}

	method puntosDe(_puntosDe) {
		puntosDe = _puntosDe
	}

}

object vidasUI {
	var property position = game.at(0, 12)
	var vidasDe

	method text() {
		return "" + self.vidasDe()
	}
	
	method textColor() {
		return "E70E0EFF"
	}

	method vidasDe() {
		return vidasDe.vida()
	}

	method vidasDe(_vidasDe) {
		vidasDe = _vidasDe
	}

}


