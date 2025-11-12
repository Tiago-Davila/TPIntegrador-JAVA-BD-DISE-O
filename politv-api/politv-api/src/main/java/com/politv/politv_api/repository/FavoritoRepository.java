package com.politv.politv_api.repository;


import com.politv.politv_api.model.Favorito;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface FavoritoRepository extends JpaRepository<Favorito, Integer> {
    List<Favorito> findByUsuarioId(Integer usuarioId);
    boolean existsByUsuarioIdAndProgramaId(Integer usuarioId, Integer programaId);
    void deleteByUsuarioIdAndProgramaId(Integer usuarioId, Integer programaId);
}


