import jarras.*
import marcas.*
import carpas.*

class Persona {
	var property peso = 0
	var property jarras = []
	var property escuchaTradicional = true
	var property nivelAguante = 0
	var property marcas = []
	var property pais = ""
	
	method estaEbria() =  self.totalAlcohol() * peso > nivelAguante
	
	method totalAlcohol() = jarras.sum({ j => j.contenidoAlcohol() })
	
	method leGusta(marca)
	
	method quiereEntrar(carpa) = self.leGusta(carpa.marca()) and self.cumplePreferencia(carpa)
	
	method cumplePreferencia(carpa) = self.escuchaTradicional() == carpa.hayBanda() 
	
	method puedeEntrar(carpa) = self.quiereEntrar(carpa) and carpa.dejaIngresar(self)
	
	method agregarJarra(jarra) { jarras.add(jarra) }
	
	method esPatriota() =  jarras.all({ jarra => jarra.marca().pais() == self.pais()})
	
	method estaEntrandoEnVicio() = (1.. (jarras.size() - 1)).all({ ind => jarras.get(ind - 1).capacidad() >= jarras.get(ind).capacidad() })
	
	method carpasQueLeSirvieron() = jarras.map({ jarra => jarra.servidaEnCarpa() })
	
	method gastoTotal() = jarras.sum({ jarra => jarra.precio() })
	
	method jarraMasCara() = jarras.max({ jarra => jarra.precio() })
	
}

class Belga inherits Persona {
	
	override method pais() = "Belgica"
	
	override method leGusta(marca) =  marca.lupulo() > 4
	
}

class Checo inherits Persona {
	
	override method pais() = "RepublicaCheca"
	
	override method leGusta(marca) =  marca.graduacion() > 8
	
}

class Aleman inherits Persona {
	
	override method pais() = "Alemania"
	
	override method leGusta(marca) = true
	
	override method quiereEntrar(carpa) = super(carpa) and carpa.personas().size().even()
	
}