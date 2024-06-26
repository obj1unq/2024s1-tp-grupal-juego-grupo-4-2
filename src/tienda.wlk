import wollok.game.*
import froggi.*
import consumibles.*
import obstaculos.*

class Bonificacion {

    method activar(personaje) {
        self.validarPuntos(personaje)
        personaje.quitarPuntos(self.costo())
        self.aplicarComportamiento(personaje)
    }

    method validarPuntos(personaje) {
        if (personaje.puntos() < self.costo()) {self.error("Puntos insuficientes") }
    }

    method costo()

    method aplicarComportamiento(personaje)
}

class VidaExtra inherits Bonificacion {

    override method costo() {
        return 700
    }

    override method aplicarComportamiento(personaje) {
        personaje.agregarVida(1)
    }

}
