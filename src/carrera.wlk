class Carrera {
	var property materias = []
	
	method addMateria(materia) {
		materias.add(materia)
	}
	
	method materiasInscriptasDe(unEstudiante) = materias.filter({m => m.estaInscripto(unEstudiante)}) 
	
}
