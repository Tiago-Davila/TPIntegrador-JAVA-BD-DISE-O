package com.politv.politv_api.service;

import com.politv.politv_api.model.Publicacion;
import com.politv.politv_api.model.EstadoPublicacion;
import com.politv.politv_api.repository.ContenidoRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PublicacionService {

    private final ContenidoRepository repo;

    public PublicacionService(ContenidoRepository repo) {
        this.repo = repo;
    }

    public List<Publicacion> listarPublicacionesPublicas(Integer programaId) {
        return repo.findByProgramaIdAndEstadoPublicacion(programaId, EstadoPublicacion.PUBLICADO);
    }
}
