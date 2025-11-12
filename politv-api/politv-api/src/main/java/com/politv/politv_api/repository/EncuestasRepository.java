package com.politv.politv_api.repository;

import com.politv.politv_api.model.Encuesta;
import com.politv.politv_api.model.EstadoPublicacion;
import com.politv.politv_api.model.Publicacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface EncuestasRepository extends JpaRepository<Encuesta, Integer> {
    List<Encuesta> findByProgramaIdAndActivaTrue(Integer programaId);
}

