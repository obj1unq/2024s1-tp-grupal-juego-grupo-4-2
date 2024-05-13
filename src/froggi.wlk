import wollok.game.*

object froggi {
	var property position = game.at(0,0)
	var property estado = chiquito
	var property vida = 2
	var puntos = 0

	method image(){
		return "froggi-" + estado.tamanio() + ".png"
	}
	
	method actualizarEstado(){
		estado = estado.siguienteEstado()
	}
	
	method quitarVida(cantidadDeDanio){
		vida -= cantidadDeDanio
	}
	
	method agregarVida(cantidad){
		vida += cantidad
	}
	
	
//	method colision(){
//		game.onCollideDo(self, { otroObjeto => otroObjeto.colision(self) })
//	}
	
	method agregarPuntos(cantidad){
		puntos += cantidad
	}
	
	method validarEstado(){
		if(estado == grande){
			self.error("No puedo volver a hacerme grande")
		}
	}
}

object chiquito{
	
	method tamanio(){
		return "chiquito"
	}
	
	method siguienteEstado(){
		return grande
	}
	
}

object grande{
	
	method tamanio(){
		return "grande"
	}
	
	method siguienteEstado(){
		return chiquito
	}
	
}