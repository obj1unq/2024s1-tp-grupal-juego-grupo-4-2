import wollok.game.*

class Froggi {
    var property position = game.at(0,0)
    var property estado = vivo
    var property vida = 3
    var puntos = 0

    method image(){
        return "froggi-" + estado.image() + ".png"
    }

//    method actualizarEstado(){
//        estado = estado.siguienteEstado()
//    }

//    method validarCrecimiento(){
//        estado.validarCrecimiento()
//    }

    method quitarVida(cantidadDeDanio){
        vida -= cantidadDeDanio
        console.println(self.vida()) // DESPUES BORRAR, SOLO DE PRUEBA
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