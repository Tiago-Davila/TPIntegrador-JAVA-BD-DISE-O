package com.politv.politv_api.repository;

import com.politv.politv_api.model.Programacion;
import com.politv.politv_api.model.Suscripcion;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface SuscripcionRepository  extends JpaRepository<Suscripcion,Integer>{
    Optional<Suscripcion> findByUsuarioIdAndProgramaIdAndActiva(Integer usuarioId, Integer programaId, Boolean activa);
}
