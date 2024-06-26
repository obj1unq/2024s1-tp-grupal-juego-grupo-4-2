import wollok.game.*
import obstaculos.*
import consumibles.*
import ui.*
import randomizer.*
import config.*

class Froggi {

	const cordDelAgua = 6
    var property position = game.at(9 , 0)
    var property vida = 5
    var property puntos = 0
	var property cantidadDeVecesGanadas = 0
	var property movimiento = new Libre(position = game.at(9, 0))

	method position(_position) {
		movimiento.position(_position)
	}

	method position() {
		return movimiento.position()
	}

	method image() {
		return "froggi.png"
	}

	method quitarVida(cantidad) {
		vida -= cantidad
		self.estoyMuerto()
	}

	method agregarVida(cantidad) {
		vida += cantidad
	}

	method agregarPuntos(cantidad) {
		puntos += cantidad
	}

	method quitarPuntos(cantidad){
        puntos -= cantidad
    }

	method estoyMuerto() {
		if (self.vida() <= 0) {
			configuracionJuego.terminarJuego(pantallaMuerte)
		}
	}

	method aumentarVecesGanadas() {
		cantidadDeVecesGanadas += 1
	}
	
	method puedeMover(direccion) {
		return direccion.posicionesValidas()
	}

	method validarMovimiento(direccion) {
		if (not self.puedeMover(direccion)) {self.error("No puedo mover")}
	}
	
	method mover(direccion) {
		self.validarMovimiento(direccion)
		self.position(direccion.siguiente(self.position()))
		self.estoySobreElAgua()
	}
	
	method estoySobreElAgua(){
		if(game.colliders(self).isEmpty() and self.position().y() > cordDelAgua ){ // poner parametro con el 6
			self.quitarVida(1)
			self.position(game.at(9 , 0))
		}
	}


}

object arriba {
	method siguiente(position) {
		return position.up(1)
	}
	
	method posicionesValidas() {
		return (froggi.position().y().between(0, game.height() - 2))
	}
}

object abajo {
	method siguiente(position) {
		return position.down(1)
	}
	
	method posicionesValidas() {
		return (froggi.position().y().between(1, game.height() - 1))
	}	
}

object izquierda {	
	method siguiente(position) {
		return position.left(1)
	}
	
	method posicionesValidas() {
		return (froggi.position().x().between(1, game.width() - 1))
	}	
}
object derecha {	
	method siguiente(position) {
		return position.right(1)
	}
	
	method posicionesValidas() {
		return (froggi.position().x().between(0, game.width() - 2))
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
