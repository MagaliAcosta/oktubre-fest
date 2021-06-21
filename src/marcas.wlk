class Marca {
	var property lupulo = 0
	var property precio = 0
	var property pais = ""
	
	method graduacion()
	
}

class CervezaRubia inherits Marca {
	var property graduacion = 0
	
}

class CervezaNegra inherits Marca {
	var property graduacionReglamentaria = 0
	
	override method graduacion() = graduacionReglamentaria.min(lupulo * 2)
	
}

class CervezaRoja inherits CervezaNegra {
	
	override method graduacion() = super() * 1.25
	
}
