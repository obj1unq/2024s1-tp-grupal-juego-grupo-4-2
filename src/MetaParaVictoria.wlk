import wollok.game.*

class Nenufar {

	var property position
	var meTocaron = false

	method image() {
		return self.imagenSegunEstado()
	}

	method colision(objeto) {
		self.actualizarVictoria(objeto)
		meTocaron = true
	}

	method actualizarVictoria(jugador) {
		if (jugador.cantidadDeVecesGanadas() < 2) {		//Al tercero debo indicar que el jugador gano
			jugador.position(game.at(0, 0))
			jugador.aumentarVecesGanadas()
		}else{
			self.ganarJuego()
		}
	}
	
	method ganarJuego(){
		game.say(self, "Felicidades, ganaste")
	}

	method imagenSegunEstado() {
		if (meTocaron) {
			return "RanitaGanadora32x32.png"
		} else {
			return "Nenufar32x32.png"
		}
	}

}

