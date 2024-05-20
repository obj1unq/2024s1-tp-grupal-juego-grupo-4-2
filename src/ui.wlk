import wollok.game.*
import froggi.*

object puntosUI {

	var property position = game.at(10, 12)
	var personajeConPuntos

	method text() {
		return self.actualizarPuntos()
	}

	method actualizarPuntos() {
		return personajeConPuntos.puntos().toString()
	}

	method personajeActual(personajeDado) {
		personajeConPuntos = personajeDado
	}

}

