package com.politv.politv_api.service;

import com.politv.politv_api.model.RespuestaTrivia;
import com.politv.politv_api.model.Trivia;
import com.politv.politv_api.repository.RespuestaTriviaRepository;
import com.politv.politv_api.repository.TriviaRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
public class TriviaService {

    private final TriviaRepository triviaRepository;
    private final RespuestaTriviaRepository respuestaRepository;

    public TriviaService(TriviaRepository t, RespuestaTriviaRepository r) {
        this.triviaRepository = t;
        this.respuestaRepository = r;
    }

    @Transactional
    public String responder(Integer triviaId, Integer usuarioId, String respuestaUsuario) throws Exception {
        if (respuestaRepository.existsByUsuarioIdAndTriviaId(usuarioId, triviaId))
            throw new Exception("Ya respondiste esta trivia.");

        Trivia trivia = triviaRepository.findById(triviaId)
                .orElseThrow(() -> new Exception("Trivia no encontrada."));

        boolean correcta = trivia.getRespuestaCorrecta()
                .equalsIgnoreCase(respuestaUsuario.trim());

        RespuestaTrivia respuesta = new RespuestaTrivia();
        respuesta.setRespuesta(respuestaUsuario);
        respuestaRepository.save(respuesta);

        return correcta ? "Respuesta correcta" : "Respuesta incorrecta";
    }
}
