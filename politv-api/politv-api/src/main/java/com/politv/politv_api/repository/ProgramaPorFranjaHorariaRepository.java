package com.politv.politv_api.repository;

import com.politv.politv_api.model.Franja;
import com.politv.politv_api.model.Programacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
@Repository
public interface ProgramaPorFranjaHorariaRepository extends JpaRepository<Programacion, Integer> {

    List<Programacion> findByFechaAndFranja(LocalDate fecha, Franja franja);

}
