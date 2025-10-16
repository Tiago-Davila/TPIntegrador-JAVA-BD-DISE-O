package com.politv.politv_api.service;

import com.politv.politv_api.model.Publicacion;
import com.politv.politv_api.model.EstadoPublicacion;
import com.politv.politv_api.repository.PublicacionRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PublicacionService {

    private final PublicacionRepository repo;

    public PublicacionService(PublicacionRepository repo) {
        this.repo = repo;
    }

    public List<Publicacion> listarPublicacionesPublicas(Integer programaId) {
        return repo.findByPrograma_IdAndEstadoPublicacion (programaId, EstadoPublicacion.PUBLICADO);
    }
}
