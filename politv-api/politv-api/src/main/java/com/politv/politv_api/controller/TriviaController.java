package com.politv.politv_api.controller;

import com.politv.politv_api.service.TriviaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class TriviaController {

    private final TriviaService triviaService;

    public TriviaController(TriviaService triviaService) {
        this.triviaService = triviaService;
    }

    @PostMapping("/trivias/{triviaId}/responder")
    public ResponseEntity<?> responder(@PathVariable Integer triviaId,
                                       @RequestParam Integer usuarioId,
                                       @RequestParam String respuesta) {
        try {
            String resultado = triviaService.responder(triviaId, usuarioId, respuesta);
            return ResponseEntity.ok(resultado);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }//corregir
}
