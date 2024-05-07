import wollok.game.*

object auto {
	var property position = game.center()
	var property image = "auto1.png"
	
	method colision(objeto){
		objeto.quitarVida()
	}
	
	method mover(){
		//Si estoy en borde izquierdo ir hacia derecha, si estoy en borde derecho ir hacia izquierda
		return game.onTick(1000, "avanzar", {self.position(position.right(1))})
	}
	
	method cambiarTipoDeAuto(){
		//Son distintos png del auto
		image = "auto" + 1.randomUpTo(3).toString() + ".png"
	}
	
}

object spawner {
	var property position = null
	
	method inicializarEnPosicionRandom(){
		//Borro cualquier otro objeto spawner que haya en el tablero
		//Posiciono este objeto en alguna posicion random solo en los bordes del tablero
		//inicializo algun obstaculo random
	}
}
