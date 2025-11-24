package com.politv.politv_api.repository;


import com.politv.politv_api.model.Favorito;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

public interface FavoritoRepository extends JpaRepository<Favorito, Integer> {
    List<Favorito> findByUsuarioId(Integer usuarioId);
    boolean existsByUsuarioIdAndProgramaId(Integer usuarioId, Integer programaId);
    void deleteByUsuarioIdAndProgramaId(Integer usuarioId, Integer programaId);

    @Query(value = "SELECT p.id, p.nombre FROM favorito f JOIN programa p ON f.programa_id = p.id WHERE f.usuario_id = :usuarioId", nativeQuery = true)
    List<Map<String, Object>> findProgramasByUsuarioId(Integer usuarioId);
}


