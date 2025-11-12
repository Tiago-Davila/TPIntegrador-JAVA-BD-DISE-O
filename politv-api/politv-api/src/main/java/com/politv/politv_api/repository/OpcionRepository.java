package com.politv.politv_api.repository;

import com.politv.politv_api.model.Opcion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OpcionRepository extends JpaRepository<Opcion, Integer> { }
