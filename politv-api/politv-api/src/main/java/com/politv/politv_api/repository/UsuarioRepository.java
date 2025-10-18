package com.politv.politv_api.repository;

import com.politv.politv_api.model.Programa;
import com.politv.politv_api.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario,Integer> {
}
