package com.politv.politv_api.service;

import com.politv.politv_api.model.RespuestaTrivia;
import com.politv.politv_api.model.Trivia;
import com.politv.politv_api.repository.RespuestaTriviaRepository;
import com.politv.politv_api.repository.TriviaRepository;
import org.springframework.stereotype.Service;

@Service
public class TriviaService {

    private final RespuestaTriviaRepository respuestaRepo;
    private final TriviaRepository triviaRepo;

    public TriviaService(RespuestaTriviaRepository respuestaRepo, TriviaRepository triviaRepo) {
        this.respuestaRepo = respuestaRepo;
        this.triviaRepo = triviaRepo;
    }

    public RespuestaTrivia responder(Integer triviaId, Integer usuarioId, String respuesta) {

        // validar trivia existente
        Trivia trivia = triviaRepo.findById(triviaId)
                .orElseThrow(() -> new RuntimeException("La trivia no existe"));

        // validar que no haya respondido antes
        respuestaRepo.findByTriviaIdAndUsuarioId(triviaId, usuarioId)
                .ifPresent(r -> {
                    throw new RuntimeException("El usuario ya respondió esta trivia");
                });

        // guardar respuesta
        RespuestaTrivia nueva = new RespuestaTrivia(triviaId, usuarioId, respuesta);
        return respuestaRepo.save(nueva);
    }
}
