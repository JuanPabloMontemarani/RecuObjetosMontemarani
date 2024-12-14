
class ObjetoMagico{
  const valorBase

  method valorQueAporta(unMago) {
    return valorBase + self.extra(unMago)
  }

  method extra(unMago)

}

class Varita inherits ObjetoMagico{
  override method extra(unMago){
    if(unMago.tieneNombrePar()){
      return 0.5 * valorBase 
    } else{
      return 0
    }
  }
}


class TunicaComun inherits ObjetoMagico{
  override method extra(unMago){
    return 2 * unMago.resistencia()
  }
}



class TunicaEpica inherits TunicaComun{
  override method extra(unMago){
    return super(unMago) + 10
  }
}


object amuleto {
  method valorQueAporta(unMago) {
    return 200
  }
}

object ojota {    // Entiendo que es un objeto ya que hay una sola ojota, que hace siempre lo mismo.   
  method valorQueAporta(unMago) {
    return 10 * unMago.largoDelNombre()
  }
}

