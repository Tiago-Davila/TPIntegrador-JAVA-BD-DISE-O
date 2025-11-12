package com.politv.politv_api.repository;

import com.politv.politv_api.model.RespuestaTrivia;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RespuestaTriviaRepository extends JpaRepository<RespuestaTrivia, Integer> {
    boolean existsByUsuarioIdAndTriviaId(Integer usuarioId, Integer triviaId);
}
