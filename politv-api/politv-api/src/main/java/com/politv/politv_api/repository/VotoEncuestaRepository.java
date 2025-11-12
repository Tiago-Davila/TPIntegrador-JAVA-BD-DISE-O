package com.politv.politv_api.repository;

import com.politv.politv_api.model.VotoEncuesta;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VotoEncuestaRepository extends JpaRepository<VotoEncuesta, Integer> {
    boolean existsByUsuarioIdAndEncuestaId(Integer usuarioId, Integer encuestaId);
}