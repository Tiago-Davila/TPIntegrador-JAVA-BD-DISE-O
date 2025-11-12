package com.politv.politv_api.repository;


import com.politv.politv_api.model.Notificacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface NotificacionRepository extends JpaRepository<Notificacion, Integer> {
    List<Notificacion> findByUsuarioIdAndFechaEnvioAfterOrderByFechaEnvioAsc(int usuarioId, LocalDateTime fechaActual);
}
