import personas.*
import jarras.*
import marcas.*

class CarpaCervecera {
	var property limiteAdmision = 0
	var property personas = []
	var property hayBanda = true
	var property jarras = []
	var property marca = ""
	var property recargo = 0
	
	method dejaIngresar(persona) = personas.size() < limiteAdmision and not persona.estaEbria()
	
	method ingresar(persona) = if (persona.puedeEntrar(self)) personas.add(persona) else throw new Exception(message = "No puede entrar")
	
	method servirJarraConCapacidadA(capacidadJarra, persona) {
		if (personas.contains(persona)) persona.agregarJarra(new Jarra (capacidad = capacidadJarra, marca = self.marca(), carpa = self))
		else throw new Exception(message = "No esta en la carpa")
		}
	
	method ebriosEmpedernidos() = self.personasEbrias().filter({ persona => self.esEbrioEmpedernido(persona) }).size()
	
	method personasEbrias() = personas.filter({ persona => persona.estaEbria() })
	
	method esEbrioEmpedernido(persona) = persona.jarras().all({ jarra => jarra.capacidad() >= 1 })
	
	method esHomogenea() = (1.. (personas.size() - 1)).all({ ind => personas.get(ind - 1).pais() == personas.get(ind).pais() })
	
	method sonCompatibles(persona1, persona2) = self.marcasCompradasDe(persona1).asSet().count({ m => self.marcasCompradasDe(persona2).contains(m) })
												> self.marcasCompradasDe(persona1).asSet().count({ m => not self.marcasCompradasDe(persona2).contains(m) })
												
	
	method marcasCompradasDe(persona) = persona.jarras().map({ jarra => jarra.marca() })
	
	method noLeSirvieronCerveza() = personas.filter({ persona => not persona.carpasQueLeSirvieron().contains(self) })
	
	method precioVenta() = marca.precio() * recargo
	
	method recargoFijo() = 1.3

	method recargoPorCantidad() {
		return
			if (personas.size() >= limiteAdmision / 2) 1.4
			else 1.25
	}
	
	method recargoPorEbriedad() {
		return 
			if (self.personasEbrias().size() >= personas.size() * 0.75) 1.5
			else 1.2
	}
	
}
