package com.politv.politv_api.controller;

import com.politv.politv_api.model.Encuesta;
import com.politv.politv_api.service.EncuestaService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
public class EncuestaController {

    private final EncuestaService encuestaService;

    public EncuestaController(EncuestaService encuestaService) {
        this.encuestaService = encuestaService;
    }

    @GetMapping("/programas/{programaId}/encuestas/activas")
    public ResponseEntity<List<Encuesta>> listar(@PathVariable Integer programaId) {
        return ResponseEntity.ok(encuestaService.listarActivas(programaId));
    }

    @PostMapping("/encuestas/{encuestaId}/votar")
    public ResponseEntity<?> votar(@PathVariable Integer encuestaId,
                                   @RequestParam Integer usuarioId,
                                   @RequestParam Integer opcionId) {
        try {
            encuestaService.votar(encuestaId, usuarioId, opcionId);
            return ResponseEntity.ok("Voto registrado correctamente");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }//http://localhost:8080/api/encuestas/1/votar?usuarioId=2&opcionId=6
}
