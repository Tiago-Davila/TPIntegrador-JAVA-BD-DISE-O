package com.politv.politv_api.repository;
import org.springframework.data.jpa.repository.JpaRepository;
import com.politv.politv_api.model.Programacion;
import java.time.LocalDate;
import java.util.List;

public interface ProgramacionRepository extends JpaRepository<Programacion,Integer> {
    List<Programacion> findByFechaAndFranja(LocalDate fecha, String franja);
    List<Programacion> findByFecha(LocalDate fecha);
}

