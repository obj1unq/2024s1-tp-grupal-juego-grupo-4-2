import wollok.game.*

object froggi {
	var property position = game.center()
	var property estado = chiquito

	method image(){
		return estado.activar()
	}
	
	method actualizarEstado(){
		estado = estado.siguienteEstado()
	}
	
}

object chiquito{
	
	method activar(){
		return "froggi-chiquito.png"
	}
	
	method siguienteEstado(){
		return grande
	}
	
}

object grande{
	
	method activar(){
		return "froggi-grande.png"
	}
	
	method siguienteEstado(){
		return chiquito
	}
	
}