import caracteristicaMago.*
class Mago{
  const nombre
  const resistencia
  const poderInnato // Int del 1 al 10
  const objetosMagicos = #{} // Supongo q no puede tener objetos repetidos
  var property energiaMagica = 100 // Supongo que arranca en 100
  var caracteristicaMago = aprendiz // Supongo que todos inician siendo aprendices


  method resistencia() {
    return resistencia
  }

  method tieneNombrePar() {
    return nombre.size().even()
  }

  method largoDelNombre() {
    return nombre.size()
  }

  //PUNTO 1

  method poderTotal() {
    return objetosMagicos.sum({unObjeto => unObjeto.valorQueAporta(self)})
  }

  //PUNTO 2
  
  method desafiar(otroMago) {
    if(otroMago.esVencidoPor(self)){
      self.robarEnergiaMagica(otroMago)
    }
  }

  method esVencidoPor(otroMago){   // Tal vez es sobredelegacion pero creo que quedo mas claro y declarativo
    return caracteristicaMago.esVencida(self,otroMago)
  } 


  method robarEnergiaMagica(otroMago) {
    caracteristicaMago.perderEnergia(otroMago)
    energiaMagica = energiaMagica + otroMago.energiaMagica()
  }

  method perderEnergiaEn(unaCantidad) {  // Lo que le envio es 0.5 por ejemplo que representa el 50%
    energiaMagica = energiaMagica * unaCantidad
  }



}


