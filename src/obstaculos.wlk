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
		return nombreDeObstaculo + ".png"
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

object spawnerDeObstaculos {

	const property autos = []

	method inicializarEn(obstaculo, position) {
		obstaculo.position(position)
		game.addVisual(obstaculo)
		obstaculo.mover()
		autos.add(obstaculo)
	}

	method init() {
		game.onTick(1000, "SPAWNER DE AUTO3", { self.inicializarEn(new Obstaculo(nombreDeObstaculo = "auto3", cantidadDeDanio = 1, velocidad = 200), game.at(0, 3))})
		game.onTick(2000, "SPAWNER DE AUTO2", { self.inicializarEn(new Obstaculo(nombreDeObstaculo = "auto2", cantidadDeDanio = 1, velocidad = 600), game.at(game.width() - 1, 2))})
		game.onTick(3000, "SPAWNER DE AUTO1", { self.inicializarEn(new Obstaculo(nombreDeObstaculo = "auto1", cantidadDeDanio = 1, velocidad = 400), game.at(0, 1))})
	}

	method quitarAutos() {
		// Quita todos los autos que este en pantalla y para los onTick
		game.removeTickEvent("SPAWNER DE AUTO3")
		game.removeTickEvent("SPAWNER DE AUTO2")
		game.removeTickEvent("SPAWNER DE AUTO1")
		autos.forEach{ auto => game.removeVisual(auto)}
		autos.clear()
	}

}

