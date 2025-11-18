package com.politv.politv_api.repository;

import com.politv.politv_api.model.RespuestaTrivia;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RespuestaTriviaRepository extends JpaRepository<RespuestaTrivia, Integer> {

    Optional<RespuestaTrivia> findByTriviaIdAndUsuarioId(Integer triviaId, Integer usuarioId);

}
