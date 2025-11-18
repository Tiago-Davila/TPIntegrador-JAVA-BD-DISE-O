package com.politv.politv_api.controller;

import com.politv.politv_api.dto.RespuestaTriviaDTO;
import com.politv.politv_api.model.RespuestaTrivia;
import com.politv.politv_api.service.TriviaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/trivias")
public class TriviaController {

    private final TriviaService triviaService;

    public TriviaController(TriviaService triviaService) {
        this.triviaService = triviaService;
    }

    @PostMapping("/{triviaId}/responder")
    public ResponseEntity<?> responder(@PathVariable Integer triviaId, @RequestBody RespuestaTriviaDTO request) {
        try {
            RespuestaTrivia respuesta = triviaService.responder(triviaId, request.getUsuarioId(), request.getRespuesta());
            return ResponseEntity.ok(respuesta);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }//http://localhost:8080/api/trivias/3/responder
//    {
//        "usuarioId": 1,
//            "respuesta": "Mi respuesta elegida"
//    }
}
