import wollok.game.*

object auto {
	var property position = game.origin()
	
	method image(){
		return "auto1.png"
	}
	
	method colision(objeto){
		objeto.quitarVida()
	}
	
	method mover(){
		return game.onTick(1000, "avanzar", {self.position()})
	}
}

//object spawn {
//	var property altura 
//	var posicion = game.at(altura,0)
//}
