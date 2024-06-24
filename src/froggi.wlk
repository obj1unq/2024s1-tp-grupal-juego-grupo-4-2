import wollok.game.*
import obstaculos.*
import consumibles.*
import ui.*
import randomizer.*
import config.*

class Froggi {
    var property position = game.origin()
    var property estado = vivo
    var property vida = 7
    var property puntos = 0
	
    method image(){
        return "froggi-" + estado.image() + ".png"
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

	method quitarPuntos(cantidad){
        puntos -= cantidad
    }

    method estoyMuerto() {
        if (self.vida() <= 0) {self.terminarJuego()}
    }

    method terminarJuego() {
        self.position(game.origin())
        self.vida(7)
        self.puntos(0)
        configuracionPantallas.pantallaMuerte()
    }
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