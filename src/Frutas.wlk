import wollok.game.*
import froggi.*
import randomizer.*


class Banana{
	
	const property puntosQueAporta = 300
	const property vidaExtra = 1
	
	method image(){
		return "banana.png"
	}
	
	method colision(objeto){
		objeto.agregarVida(vidaExtra)
		objeto.agregarPuntos(puntosQueAporta)
		game.removeVisual(self)
	}
	
}

class Uva{
	const property puntosQueAporta = 200
	
	
	method image(){
		return "uva.png"
	}	
	
	method colision(objeto){
		objeto.agregarPuntos(puntosQueAporta)
		game.removeVisual(self)
	}	
}

class Manzana{
	
	var property position = randomizer.emptyPosition()
	const property puntosQueAporta = 100
	
	method image(){
		return "manzana-roja.png"
	}
		
	method colision(objeto){
		objeto.agregarPuntos(puntosQueAporta)
		game.removeVisual(self)
	}
	
}

object manzanaFactory {

	method crearComida() {
		const manzana = new Manzana()
		game.addVisual(manzana)
		
	}

}