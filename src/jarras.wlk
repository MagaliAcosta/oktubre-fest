import marcas.*

class Jarra {
	var property capacidad = 0
	var property carpa = 0
	var property marca = ""
	
	method contenidoAlcohol() = capacidad * marca.graduacion()
	
	method precio() = carpa.precioVenta() * capacidad
	
}
