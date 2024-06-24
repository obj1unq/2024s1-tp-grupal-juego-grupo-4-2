import wollok.game.*
import obstaculos.*
import consumibles.*
import ui.*
import randomizer.*

class Froggi {

	var property estado = vivo
	var vida = 7
	var puntos = 0
	var cantidadDeVecesGanadas = 0
	var property movimiento = new Libre(position = game.at(0, 0))

	method position(_position) {
		movimiento.position(_position)
	}

	method position() {
		return movimiento.position()
	}

	method vida() {
		return vida
	}

	method puntos() {
		return puntos
	}

	method image() {
		return "froggi-" + estado.image() + ".png"
	}

	method cantidadDeVecesGanadas() {
		return cantidadDeVecesGanadas
	}

	method quitarVida(cantidad) {
		vida -= cantidad
			// console.println(self.vida()) // DESPUES BORRAR, SOLO DE PRUEBA
		self.estoyMuerto()
	}

	method agregarVida(cantidad) {
		vida += cantidad
	}

	method agregarPuntos(cantidad) {
		puntos += cantidad
	}

	method estoyMuerto() {
		if (self.vida() <= 0) {
			self.terminarJuego()
		}
	}

	method terminarJuego() {
		self.estado(muerto)
		game.clear()
		game.addVisual(self)
		game.say(self, "Estoy muerto, presiona R para reintentar")
	}

	method aumentarVecesGanadas() {
		cantidadDeVecesGanadas += 1
	}

	method moverArriba() {
		self.position(self.position().up(1))
		self.estoySobreElAgua()
	}

	method moverAbajo() {
		self.position(self.position().down(1))
		self.estoySobreElAgua()
	}

	method moverIzquierda() {
		self.position(self.position().left(1))
		self.estoySobreElAgua()
	}

	method moverDerecha() {
		self.position(self.position().right(1))
		self.estoySobreElAgua()
	}
	
	method estoySobreElAgua(){
		if(!movimiento.estoySobreTronco() and self.position().y() > 6 ){
			self.quitarVida(1)
			self.position(game.origin())
		}
	}

}

class SobreTronco {

	var property transporte
	var property personaje

	method position() {
		return transporte.position()
	}

	method position(_position) {
		personaje.movimiento(new Libre(position = _position))
	}
	
	method estoySobreTronco(){
		return true
	}

}

class Libre {

	var property position
	
	method estoySobreTronco(){
		return false
	}

}

object vivo {

	method image() {
		return "vivo"
	}

}

object muerto {

	method image() {
		return "muerto"
	}

}

