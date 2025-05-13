
object luke{
    var cantidadViajes = 0
    var recuerdo = null
    var vehiculo = alambiqueVeloz

    method cantidadViajes() = cantidadViajes 

    method viajar(lugar){
        if (lugar.puedeLlegar(vehiculo)) {
            cantidadViajes = cantidadViajes + 1
            recuerdo = lugar.recuerdoTipico()
            vehiculo.desgaste()
        }
    }
    method recuerdo() = recuerdo
    method vehiculo(nuevo) {vehiculo = nuevo}
}
object alambiqueVeloz {
    var rapido = true
    var combustible = 20
    const consumoPorViaje = 10
    var patente = "AB123JK"
    method puedeFuncionar() = combustible >= consumoPorViaje
    method desgaste() {
        combustible = combustible - consumoPorViaje
    }
    method rapido() = rapido
    method patenteValida() = patente.head() == "A"
}

object paris{
    method recuerdoTipico() = "Llavero Torre Eiffel"
    method puedeLlegar(movil) =  movil.puedeFuncionar() 
    
}

object buenosAires{
    method recuerdoTipico() = "Mate"
    method puedeLlegar(auto) =  auto.rapido() 
}

object bagdad {
    var recuerdo = "bidon de petroleo"
    method recuerdoTipico() = recuerdo
    method recuerdo(nuevo) {recuerdo = nuevo }
    method puedeLlegar(cualquierCosa) = true
}

object lasVegas{
    var homenaje = paris
    method homenaje(lugar) {homenaje = lugar}
    method recuerdoTipico() = homenaje.recuerdoTipico()
    method puedeLlegar(vehiculo) = homenaje.puedeLlegar(vehiculo)
}

object antigualla {
    var gangsters = 7
    method puedeFuncionar() = gangsters.even()
    method rapido() = gangsters > 6
    method desgaste(){
        gangsters = gangsters -1
    }
    method patenteValida() = chatarra.rapido() 

}
object chatarra {
    var cañones = 10
    var municiones = "ACME"
    method puedeFuncionar() = municiones == "ACME" and cañones.between(6,12)
    method rapido() = municiones.size() < cañones
    method desgaste(){
        cañones = (cañones / 2).roundUp(0)
        if (cañones < 5 )
          municiones = municiones + " Obsoleto"
    }
    method patenteValida() = municiones.take(4) == "ACME" 
    method cañones() = cañones
}

object convertible{
    var convertido = antigualla
    method puedeFuncionar() = convertido.puedeFuncionar() 
    method rapido() = convertido.rapido()
    method desgaste(){
        convertido.desgaste()
    }
    method convertir(vehiculo){
        convertido = vehiculo
    }
    method patenteValida() = convertido.patenteValida()
 
}

object hurlingham{
   method puedeLlegar(vehiculo) =
     vehiculo.puedeFuncionar() and vehiculo.rapido() and vehiculo.patenteValida()
  method recuerdoTipico() = "sticker de la Unahur"
}


object moto{
    method rapido() = true
    method puedeFuncionar() = not moto.rapido()
    method desgaste() { }
    method patenteValida() = false
}
object autosLocos{
    var ciudad = paris
    const inscripcion = []
    const autosAcept = []
    // si no son rechazados son aceptados
    const rechazados = []
    method inscripto(unAuto){
        inscripcion.add(unAuto)
        // los inscribe pero todavia no son aceptados
    }
    method ciudad() = ciudad
    // si quiero saber la ciudad
    method ciudadAct(unaCiudad) {ciudad = unaCiudad}
    // si la quiero cambiar la ubicacion
    method verificaVehiculo(unVehiculo){
        if(ciudad.puedeLlegar(unVehiculo)){
            autosAcept.add(unVehiculo)
        }
        else{
            rechazados.add(unVehiculo)
            // si no son aceptados entonces
            // los mandamos a la lista de rechazados
        }
    }
    method replanificar(nuevaCiudad,vehiculo){
        // cambiar la ciudad
        self.ciudadAct(nuevaCiudad)
        // cambio la ciudad
        inscripcion.forEach({p=> p.verificaVehiculo(vehiculo)})
        // recorro la lista de inscriptos y vuelvo a modificar
    }
    // necesito un metodo para recorrer los vehiculos aceptados
    method vehiculosAceptados() = autosAcept
}
object carrera{
    method viajarHastaCiudad(){
        return autosLocos.vehiculosAceptados().forEach({p=>p.desgaste()})
        // hacemos que se desgaste 
        // no hay funcion clara para hacer esto
    }
    method obtenerGanador(){
        return autosLocos.vehiculosAceptados().anyOne()
        // devuelve cualquier objeto porque no sabemos
        // cual de ellos fueron los que terminaron en menos tiempo
        // entonces que devuelva cualquiera
    }
}
object auto2{
    method auto(){
        
    }
}