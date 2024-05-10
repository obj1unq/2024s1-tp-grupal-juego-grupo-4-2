import wollok.game.*

class Obstaculo {

	var property position = null
	var property nombreDeObstaculo // TIPO: String
	var property cantidadDeDanio
	var property velocidad

	method colision(objeto) {
		objeto.quitarVida(cantidadDeDanio) // Polimorfismo con froggi, es necesario crearlo en froggi
	}

	method image() {
//		return self.cambiarTipo(nombreDeObstaculo)  //No funciona como se espera
		return nombreDeObstaculo + "1.png"
	}

	method mover() {
		if (self.estoyEnElBordeDelTablero(game.at(0, position.y()))) { // El parametro signfica borde izquierdo
			return game.onTick(velocidad, "avanzar", { self.position(position.right(1)) })
		} else {
			return game.onTick(velocidad, "avanzar", { self.position(position.left(1)) })
		}
	}

	method cambiarTipo(stringObstaculo) {
		return stringObstaculo + 1.randomUpTo(3).roundUp().toString() + ".png"
	}

	method estoyEnElBordeDelTablero(borde) {
		return self.position().distance(borde) == 0
	}

}

//object auto {
//
//	var property position = null
//	var property image = "auto1.png"
//
//	method colision(objeto) {
//		objeto.quitarVida()
//	}
//
//	method mover() {
//		if (self.estoyEnElBordeDelTablero(game.at(0, position.y()))) {
//			return game.onTick(1000, "avanzar", { self.position(position.right(1)) })
//		} else {
//			return game.onTick(1000, "avanzar", { self.position(position.left(1)) })
//		}
//	}
//
//	method cambiarTipoDeAuto() {
//		// Son distintos png del auto
//		image = "auto" + 1.randomUpTo(3).toString() + ".png"
//	}
//
//	method estoyEnElBordeDelTablero(borde) {
//		return self.position().distance(borde) == 0
//	}
//
//}
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

