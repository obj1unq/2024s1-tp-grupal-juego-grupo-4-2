import wollok.game.*

object auto {

	var property position = null
	var property image = "auto1.png"

	method colision(objeto) {
		objeto.quitarVida()
	}

	method mover() {
		// Si estoy en borde izquierdo ir hacia derecha, si estoy en borde derecho ir hacia izquierda
		return game.onTick(1000, "avanzar", { self.position(position.right(1)) })
	}

	method cambiarTipoDeAuto() {
		// Son distintos png del auto
		image = "auto" + 1.randomUpTo(3).toString() + ".png"
	}

}

object spawner {

	method inicializarEnPosicionRandom(obstaculo) {
		self.izquierdaODerechaDelTablero()
		obstaculo.position(self.izquierdaODerechaDelTablero())
		game.addVisual(obstaculo)
		obstaculo.mover()
	}

	method izquierdaODerechaDelTablero() {
		if (0.randomUpTo(10) > 5) {
			return game.at(game.width() - 1, 0.randomUpTo(game.height() - 1))
		} else { 
			return game.at(0, 0.randomUpTo(game.height() - 1))
		}
	}

}

