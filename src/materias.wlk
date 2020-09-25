

class Materia {
	var property inscriptos = []
	var property correlativas = []
	
	method cumpleRequisitos(unEstudiante) = correlativas.all({mc => unEstudiante.tieneAprobada(mc)})
	
	method estaInscripto(unEstudiante) = inscriptos.contains(unEstudiante)
}
