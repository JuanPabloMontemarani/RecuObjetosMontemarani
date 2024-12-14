import Mago.*

// El enunciado decia que deben poder cambiar a lo largo del tiempo. No pide implementar ni tampoco da la condicion para que 
// cambien. Pero por este motivouse composicion y no herencia. Ya que seria mas facil cambiar la caracteristica
object aprendiz{
  method esVencida(unMago,unAtacante) {
    return unMago.resistencia() < unAtacante.poderTotal()
  }

  method perderEnergia(unMago) {
    unMago.perderEnergiaEn(0.5)
  }
}

object veterano {
  method esVencida(unMago,unAtacante) {
    return unAtacante.poderTotal() >= 1.5 * unMago.resistencia()
  }

  method perderEnergia(unMago) {
    unMago.perderEnergiaEn(0.25)
  }
}

object inmortal{
  method esVencidoPor(unMago,unAtacante) {
    return false
  }

  method perderEnergia(unMago){} // Que lo conozca unicamente para que sea polimorfico pero creo que nunca lo llegaria a usar
                           // Lo dejo por si en algun momento se desea cambiar algo => Inmortal conocera el mensaje perderEnergia()
}