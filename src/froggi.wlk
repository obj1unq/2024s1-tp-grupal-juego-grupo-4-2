import wollok.game.*
import obstaculos.*
import consumibles.*
import ui.*
import randomizer.*

class Froggi {
	
    var property estado = vivo
    var vida = 7
    var puntos = 0
    var cantidadDeVecesGanadas = 0
    var property movimiento = new Libre(position = game.at(0 , 0))

	
	method position(_position){
		movimiento.position(_position)
	}
	
	method position(){
		return movimiento.position()
	}
	

	method vida() {
		return vida
	}

	method puntos(){
		return puntos	
	}
	
    method image(){
        return "froggi-" + estado.image() + ".png"
    }
    
    method cantidadDeVecesGanadas(){
    	return cantidadDeVecesGanadas
    }

//    method actualizarEstado(){
//        estado = estado.siguienteEstado()
//    }

//    method validarCrecimiento(){
//        estado.validarCrecimiento()
//    }

    method quitarVida(cantidad){
        vida -= cantidad
       // console.println(self.vida()) // DESPUES BORRAR, SOLO DE PRUEBA
        self.estoyMuerto()
    }

    method agregarVida(cantidad){
        vida += cantidad
    }

    method agregarPuntos(cantidad){
        puntos += cantidad
    }



    method estoyMuerto() {
        if (self.vida() <= 0) {self.terminarJuego()}
    }

    method terminarJuego() {
        self.estado(muerto)
        game.clear()
        game.addVisual(self)
        game.say(self, "Estoy muerto, presiona R para reintentar")
    }
    
    method aumentarVecesGanadas(){
    	cantidadDeVecesGanadas += 1
    }
}

class SobreTronco{
	
	var property transporte
	var property personaje

	method position(){
		return transporte.position()
	}
	
	method position(_position){
		personaje.movimiento(new Libre(position = _position))
	}		
	
	
	
}

class Libre{
	
	var property position
	
	
	
}





object vivo{

    method image(){
        return "vivo"
    }

//    method siguienteEstado(){
//        return grande
//    }
//
//    method validarCrecimiento() {
//
//    }

}

//object grande{
//
//    method image(){
//        return "grande"
//    }
//
//    method siguienteEstado(){
//        return chiquito
//    }
//
//    method validarCrecimiento() {
////        console.println("llamada a validar con error")
////        self.error("No puedo volver a hacerme grande")
//    }
//
//}

object muerto {

    method image(){
        return "muerto"
    }

//    method siguienteEstado(){
//
//    }
//
//    method validarCrecimiento() {
////        console.println("llamada a validar con error")
////        self.error("No puedo volver a hacerme grande")
//    }

}