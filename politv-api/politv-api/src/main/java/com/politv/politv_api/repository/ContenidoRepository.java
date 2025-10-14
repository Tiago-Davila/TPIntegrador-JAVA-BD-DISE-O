package com.politv.politv_api.repository;

import com.politv.politv_api.model.EstadoPublicacion;
import com.politv.politv_api.model.Publicacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ContenidoRepository extends JpaRepository<Publicacion, Integer> {
    List<Publicacion> findByProgramaIdAndEstadoPublicacion(int programaId, EstadoPublicacion estadoPublicacion);
}
