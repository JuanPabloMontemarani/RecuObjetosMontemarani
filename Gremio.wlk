
import Mago.*
import ObjetoMagico.*
class Gremio{
  const magos = #{}
  var lider // Es un Mago

  method poderTotal() {
    return magos.sum({unMago => unMago.poderTotal()}) // Entiendo que puede haber repeticion de logica en reservaEnergia() y resistencia() al momento de hacer la sumatoria
  }                                                  // Pero hacer un nuevo metodo sumatoria y pasarle la condicion me parece un poco lo mismo ya que repetiria sumatoria en todos lados

  method reservaEnergia() {
    return magos.sum({unMago => unMago.energiaMagica()}) 
  }

  method resistencia() {
    return magos.sum({unMago => unMago.resistencia()}) + lider.resistencia()
  }



  //PUNTO 2 PARTE B
  method desafiar(unOponente) { // un oponente puede ser un gremio o un mago
    if(self.esVencidoPor(unOponente)){
      self.robarEnergiaMagica(unOponente)
    }
  }

  method esVencidoPor(unOponente) {
    return self.poderTotal() > unOponente.poderTotalDeLider() + unOponente.resistencia()
  }

  method lider() { 
    return magos.max({unMago => unMago.poderTotal()}) 
  }

  method poderTotalDeLider() {
    return self.lider().poderTotal()
  }

  method robarEnergiaMagica(unOponente) {
    unOponente.magos().forEach({unMago => lider.robarEnergiaMagica(unMago)})
  }

  method magos() {
    return magos
  }



}
// PUNTO 1 PARTE B

const gremioPedido = new Gremio (magos = #{mago1,mago2} , lider = mago1) 
const mago1 = new Mago(nombre = "juan" , resistencia = 50 , poderInnato = 9 , objetosMagicos = #{amuleto})
const mago2 = new Mago(nombre = "pablo" , resistencia = 10 , poderInnato = 10 , objetosMagicos = #{ojota})

// El lider seria Juan ya que es el que mas poder tiene. Luego podria cambiar. Por ejemplo si pablo consigue un amuleto.


// PUNTO 3 PARTE B
/*
Es posible gracias a la composicion y al polimorfismo. Ya que los gremios estan compuestos por una lista de magos.
Por lo tanto si se quiere agregar un gremio podra ser posible ya que "ingresaran" a un gremio como magos tambien.
*/
