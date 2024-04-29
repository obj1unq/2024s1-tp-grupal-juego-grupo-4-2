import wollok.game.*

object froggi {
	var property position = game.center()
	var property estado = chiquito

	method image(){
		return "froggi-" + estado.tamanio() + ".png"
	}
	
	method actualizarEstado(){
		estado = estado.siguienteEstado()
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