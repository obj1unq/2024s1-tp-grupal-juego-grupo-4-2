import wollok.game.*
import froggi.*
import randomizer.*

class Mosquito {

	var property position = randomizer.emptyPosition()

	method image() {
		return "mosquito.png"
	}

	method colision(objeto) {
		objeto.validarEstado()
		objeto.actualizarEstado()
		objeto.agregarVida(1)
		game.removeVisual(self)
	}
}

class Mosca {

	var property position = randomizer.emptyPosition()

	method image() {
		return "mosca.png"
	}

	method colision(objeto) {
		objeto.agregarVida(2)
		game.removeVisual(self)
	}
	
}

object insectoManager {
	
	const property comidas = []

	method crearInsecto() {
		if (comidas.size() < 5) {
			comidas.add([ mosquitoFactory, moscaFactory ].anyOne().crearInsecto())
		}
	}
}

object mosquitoFactory {

	method crearInsecto() {
		const mosquito = new Mosquito()
		game.addVisual(mosquito)
		return mosquito
	}	
}

object moscaFactory {

	method crearInsecto() {
		const mosca = new Mosca()
		game.addVisual(mosca)	
		return mosca
	}
}
