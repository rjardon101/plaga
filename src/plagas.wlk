class Elementos {

	method esBueno()

	method ataqueDePlaga(unaPlaga)

}

class Hogar inherits Elementos {

	var property mugre 
	var confort 

	override method esBueno() {
		return mugre < confort / 2
	}

	override method ataqueDePlaga(unaPlaga) {
		mugre += unaPlaga.danioProducido()
	}

}

class Huerta inherits Elementos {

	var property produccion 

	override method esBueno() {
		return produccion > parametrosParaHuerta.produccionRequerida()
	}

	override method ataqueDePlaga(unaPlaga) {
		produccion -= unaPlaga.danioProducido()
		if (unaPlaga.transmiteEnfermedades()) {
			produccion -= 10
		} else produccion -= 0
	}

}

object parametrosParaHuerta {
	
	var property produccionRequerida
}

class Mascota inherits Elementos {

	var property salud 

	override method esBueno() {
		return salud >= 15
	}
	
	override method ataqueDePlaga(unaPlaga) {
		if (unaPlaga.transmiteEnfermedades()) {
			salud -= unaPlaga.danioProducido() 
		}
		
		else salud
	}
	    

}

class Plaga {

	var property poblacion 

	method danioProducido() {
		return poblacion * 2
	}

	method transmiteEnfermedades() {
		return true
	}
	
	method aumentarPoblacion() {
		return poblacion += 0.1
	}
	
	method ataque(unElemento) {
		unElemento.ataqueDePlaga(self) 
		poblacion += poblacion * 0.1
	}

}

class Cucaracha inherits Plaga {

	override method danioProducido() {
		return poblacion / 2
	}

	override method transmiteEnfermedades() {
		return poblacion > 500
	}

}

class Pulga inherits Plaga {

}

class Garrapata inherits Plaga {

	override method ataque(unLugar) {
		unLugar.ataqueDePlaga(self) 
		poblacion += poblacion * 0.2
	
	}

}

class Mosquito inherits Plaga {

	var infeccion = #{}

	override method danioProducido() {
		return poblacion
	}

	override method transmiteEnfermedades() {
		return !infeccion.isEmpty()
	}

	method agregarInfeccion(unaInfeccion) {
		infeccion.add(unaInfeccion)
	}

}

