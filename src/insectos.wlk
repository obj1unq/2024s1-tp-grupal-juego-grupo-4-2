import wollok.game.*
import froggi.*

object mosquito {

	method image() {
		return "mosquito.png"
	}

	method colision(objeto) {
		objeto.validarEstado(grande)
		objeto.actualizarEstado()
		objeto.agregarVida(1)
		game.removeVisual(self)
	}
}

object mosca {

	method image() {
		return "mosca.png"
	}

	method colision(objeto) {
		objeto.agregarVida(2)
		game.removeVisual(self)
	}
}
