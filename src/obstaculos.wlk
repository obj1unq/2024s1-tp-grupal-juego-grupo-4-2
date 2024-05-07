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
		return game.onTick(1000, "avanzar", {self.position(position.right(1))})
	}
}

object spawn {
	
}
