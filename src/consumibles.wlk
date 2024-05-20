import wollok.game.*
import froggi.*
import randomizer.*

class Consumibles{
	
	var property position = randomizer.emptyPosition()
	
	method colision(objeto) {
		objeto.agregarPuntos(self.puntosQueAporta())
		game.removeVisual(self)
	}
	
	method puntosQueAporta(){
			return 0
	}
}

class Frutas inherits Consumibles{
	
	override method colision(objeto){
		super(objeto)
		consumiblesManager.frutas().remove(self)
	}
}

class Banana inherits Frutas{
	
	method image(){
		return "banana.png"
	}
	
	override method puntosQueAporta(){
			return 300
	}
	
}

class Uva inherits Frutas{
	
	method image(){
		return "uva.png"
	}	
	
	override method puntosQueAporta(){
			return 200
	}	
}

class Manzana inherits Frutas{
	
	method image(){
		return "manzana-roja.png"
	}
		
	override method puntosQueAporta(){
			return 100
	}

}

class Insecto inherits Consumibles{
	
	override method colision(objeto) {
		objeto.agregarVida(1)
		super(objeto)
		consumiblesManager.insectos().remove(self)
	}
}

class Mosquito inherits Insecto{

	method image() {
		return "mosquito.png"
	}

	override method colision(objeto) {	
		objeto.validarCrecimiento()
		objeto.actualizarEstado()
		super(objeto)
	}
}

class Mosca inherits Insecto{

	method image() {
		return "mosca.png"
	}
	
}

object consumiblesManager {
	
	const property insectos = []
	const property frutas = []

	method crearInsecto() {
		if (insectos.size() < 5) {
			const insecto = [(new Mosquito()), (new Mosca()) ].anyOne()
			self.agregarConsumible(insecto , insectos)
			//console.println(insectos)
		}
	}
	
	method crearFruta() {
		if (frutas.size() < 9) {
			const fruta = [(new Manzana()), (new Uva()) ,(new Banana()) ].anyOne()
			self.agregarConsumible(fruta , frutas)
			console.println(frutas)
			//frutas.add([self.creador((new Manzana())), self.creador((new Uva())) , (new Banana())].anyOne())
		}
	}
	
	method agregarConsumible(consumible , listaConsumible){
		listaConsumible.add(consumible)
		game.addVisual(consumible)
	}
	
}
