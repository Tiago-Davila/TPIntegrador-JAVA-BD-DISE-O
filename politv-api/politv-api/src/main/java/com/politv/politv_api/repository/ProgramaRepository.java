package com.politv.politv_api.repository;

import com.politv.politv_api.model.Programa;
import com.politv.politv_api.model.Programacion;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProgramaRepository extends JpaRepository<Programa,Integer> {
}
