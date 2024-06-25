import wollok.game.*

class ColisionadorDeVictoria {

	var property position = game.at(0, 0)
	var property image = ""

	method colision(personaje) {
		// Cambiar la imagen actual a una de una rana
		// Si el objeto actual ya tiene una rana adentro entonces no sumar a la cantidad de ranas llegadas
		condicionadorDeVictoria.validarQueNoHayaLlegadoAca(self)
		condicionadorDeVictoria.ranasLlegadas().add(self)
		personaje.position(game.at(0, 0))
		self.image("otra imagen que indique que la rana llego aca")
	}

}

object condicionadorDeVictoria {

	var property ranasLlegadas = #{}

	method validarQueNoHayaLlegadoAca(colisionador) {
		if (ranasLlegadas.contains(colisionador)) {
			self.error("La rana ya llego a este punto alguna vez")
		}
	}

	method condicionDeVictoria() {
		if (ranasLlegadas.size() >= 4) {
		// Se limpia todo el juego y la rana dice algo en el medio
		}
	}

}

