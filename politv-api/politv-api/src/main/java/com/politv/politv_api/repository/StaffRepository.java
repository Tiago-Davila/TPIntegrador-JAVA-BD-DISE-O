package com.politv.politv_api.repository;


import com.politv.politv_api.model.Staff;
import com.politv.politv_api.model.Suscripcion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StaffRepository extends JpaRepository<Staff, Integer> {

}
