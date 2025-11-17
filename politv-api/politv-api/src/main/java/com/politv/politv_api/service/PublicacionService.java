package com.politv.politv_api.service;

import com.politv.politv_api.model.PalabraProhibida;
import com.politv.politv_api.model.Programa;
import com.politv.politv_api.model.Publicacion;
import com.politv.politv_api.model.EstadoPublicacion;
import com.politv.politv_api.repository.PalabraProhibidaRepository;
import com.politv.politv_api.repository.ProgramaRepository;
import com.politv.politv_api.repository.PublicacionRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PublicacionService {

    private final PublicacionRepository publicacionRepository;
    private final PalabraProhibidaRepository palabraProhibidaRepository;
    private final ProgramaRepository programaRepository;

    public PublicacionService(PublicacionRepository publicacionRepository, PalabraProhibidaRepository palabraProhibidaRepository, ProgramaRepository programaRepository) {
        this.publicacionRepository = publicacionRepository;
        this.palabraProhibidaRepository = palabraProhibidaRepository;
        this.programaRepository = programaRepository;
    }

    public PublicacionRepository getPublicacionRepository() {
        return publicacionRepository;
    }

    public PalabraProhibidaRepository getPalabraProhibidaRepository() {
        return palabraProhibidaRepository;
    }

    public ProgramaRepository getProgramaRepository() {
        return programaRepository;
    }

    public List<Publicacion> listarPublicacionesPublicas(Integer programaId) {
        return publicacionRepository.findByPrograma_IdAndEstadoPublicacion (programaId, EstadoPublicacion.PUBLICADO);
    }
    public Publicacion crearComentario(Integer programaId, Integer usuarioId, String contenido) {
        List<PalabraProhibida> prohibidas = palabraProhibidaRepository.findAll();

        boolean contienePalabraProhibida = prohibidas.stream().anyMatch(p -> contenido.toLowerCase().contains(p.getPalabra().toLowerCase()));
    // se fija si contiene la palabra prohibida y en el if lo marca como pendiente de revision o publicado
        EstadoPublicacion estado;
        if (contienePalabraProhibida) estado = EstadoPublicacion.PENDIENTE_REVISION;
            else estado = EstadoPublicacion.PUBLICADO;
        Programa programa = programaRepository.findById(programaId).orElseThrow(() -> new RuntimeException("Programa no encontrado"));


        Publicacion nueva = new Publicacion(programa, contenido, usuarioId, estado);
        publicacionRepository.save(nueva);
        return publicacionRepository.save(nueva);
    }

}
