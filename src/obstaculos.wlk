import wollok.game.*

class Vehiculo {

	var property position = null
	var property velocidad

	method colision(personaje) {
		personaje.quitarVida(self.damage()) // Polimorfismo con froggi, es necesario crearlo en froggi
	}

	method image()

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
	method damage()
}

class Camion inherits Vehiculo{
	
	const camiones = #{"camion-verde.png" , "camion-rojo.png"}
	
	const property damage = 3
	
	override method image(){
		return camiones.anyOne()
	}
	
	override method colision(personaje){
		personaje.position(game.at(personaje.position().x() , personaje.position().y() - 1) )
		super(personaje)
	}

}

class Moto inherits Vehiculo{
	
	const property damage = 1
	
	override method image(){
		return "motoPrueba2.png"
	}
	
}

class Auto inherits Vehiculo{
	
	const property damage = 2
	const property autos = #{"auto1.png" , "auto3.png"}
	
	override method image(){
		return autos.anyOne()
	}
	
}


object spawnerDeObstaculos {

	const property autos = []

	method spawner(){
		
	}


	method inicializarEn(obstaculo, position) {
		obstaculo.position(position)
		game.addVisual(obstaculo)
		obstaculo.mover()
		autos.add(obstaculo)
	}

//	method init() {
//		game.onTick(1000, "SPAWNER DE AUTO3", { self.inicializarEn(new Moto( velocidad = 200), game.at(0, 3))})
//		game.onTick(2000, "SPAWNER DE AUTO2", { self.inicializarEn(new Auto( velocidad = 600), game.at(game.width() - 1, 2))})
//		game.onTick(3000, "SPAWNER DE AUTO1", { self.inicializarEn(new Camion( velocidad = 400), game.at(0, 1))})
//	}
//
//	method quitarAutos() {
//		// Quita todos los autos que este en pantalla y para los onTick
//		game.removeTickEvent("SPAWNER DE AUTO3")
//		game.removeTickEvent("SPAWNER DE AUTO2")
//		game.removeTickEvent("SPAWNER DE AUTO1")
//		autos.forEach{ auto => game.removeVisual(auto)}
//		autos.clear()
//	}

}

