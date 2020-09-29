class Estudiante {

	var property carreras = []
	var materiasAprobadas = []

	method materiasAprobadas() = materiasAprobadas

	method aproboMateria(materiaAprobada, notaAprobacion) {
		if (notaAprobacion < 4) {
			self.error("esta materia no está aprobada")
		}
		if (self.tieneAprobada(materiaAprobada)) {
			self.error("esta materia ya está registrada")
		}
		materiasAprobadas.add(new MateriaAprobada(materia = materiaAprobada, nota = notaAprobacion))
	}

	method cantidadAprobadas() = materiasAprobadas.size()

	method promedio() = materiasAprobadas.sum({ ma => ma.nota() }) / self.cantidadAprobadas()

	method tieneAprobada(unaMateria) = materiasAprobadas.any({ ma => ma.materia() == unaMateria })

	method puedeInscribirseA(unaMateria) {
		return carreras.any({ c => c.materias().contains(unaMateria) }) and not self.tieneAprobada(unaMateria) and not self.estaInscriptoA(unaMateria) and self.cumpleRequisitos(unaMateria)
	}

	method inscribirseA(unaMateria) {
		if (self.puedeInscribirseA(unaMateria)) {
			unaMateria.inscriptos().add(self)
		}
	}

	method estaInscriptoA(unaMateria) = unaMateria.inscriptos().contains(self)
	
	method cumpleRequisitos(unaMateria) = unaMateria.cumpleRequisitos(self)


// [programacion, medicina] = [[objetos1, mate1] , [quimica]].flatten()
// [objetos1, mate1, quimica]

	method materiasInscriptas() = carreras.map({c => c.materiasInscriptasDe(self)})

}


class MateriaAprobada {

	var materia
	var nota

	method nota() = nota

	method materia() = materia

}

