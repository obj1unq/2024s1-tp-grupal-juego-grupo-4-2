import wollok.game.*

class Vehiculo {

	var property position 
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
	
	const camiones 
	
	const property damage = 3
	
	override method image(){
		return camiones
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
	const property autos 
	
	override method image(){
		return autos
	}
	
}


object spawnerDeVehiculos {

	const property vehiculos = []

	method autoFactory(){
		const auto = new Auto( velocidad = 600 ,position= game.at(0, 3)  , autos = ["auto1.png" , "auto3.png"].anyOne())
		self.inicializarVehiculo(auto)
//		return auto
	}
	
	method motoFactory(){
		const moto = new Moto (velocidad = 300,  position= game.at(game.width() - 1, 2))
		self.inicializarVehiculo(moto)
//		return moto
	}
	
	method camionFactory(){
		const camion = new Camion (velocidad = 900,  position= game.at(0, 1) , camiones = ["camion-verde.png" , "camion-rojo.png"].anyOne())
		self.inicializarVehiculo(camion)
//		return camion
	}
	
	method camionRapidoFactory(){
		const camion = new Camion (velocidad = 500,  position= game.at(0, 4) , camiones = ["camion-verde.png" , "camion-rojo.png"].anyOne())
		self.inicializarVehiculo(camion)
//		return camion
	}
	
	method inicializarVehiculo(vehiculo) {
		game.addVisual(vehiculo)
		vehiculo.mover()
		vehiculos.add(vehiculo)
	}
	
	method init() {
		game.onTick(3000, "SPAWNER DE AUTO", { self.autoFactory()})
		game.onTick(6000, "SPAWNER DE MOTO", { self.motoFactory()})
		game.onTick(8000, "SPAWNER DE CAMION", { self.camionFactory()})
		game.onTick(5000, "SPAWNER DE CAMION", { self.camionRapidoFactory()})
}
//
	method quitarAutos() {
		// Quita todos los autos que este en pantalla y para los onTick
		game.removeTickEvent("SPAWNER DE AUTO")
		game.removeTickEvent("SPAWNER DE MOTO")
		game.removeTickEvent("SPAWNER DE CAMION")
		vehiculos.forEach{ auto => game.removeVisual(auto)}
		vehiculos.clear()
	}

}

