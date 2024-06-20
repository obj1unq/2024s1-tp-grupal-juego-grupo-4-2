import wollok.game.*

class Nenufar {

	var property position
	var meTocaron = false

	method image() {
		return self.imagenSegunEstado()
	}

	method colision(objeto) {
		self.ganarJuego(objeto)
		meTocaron = true
	}

	method ganarJuego(jugador) {
		if (not meTocaron) {
			jugador.position(game.at(0, 0))
			//jugador.aumentarVecesGanadas()
		}
	}

	method imagenSegunEstado() {
		if (meTocaron) {
			return "RanitaGanadora32x32.png"
		} else {
			return "Nenufar32x32.png"
		}
	}

}

