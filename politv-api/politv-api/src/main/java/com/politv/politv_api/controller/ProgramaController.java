package com.politv.politv_api.controller;

import com.politv.politv_api.dto.ProgramaDetalleDTO;
import com.politv.politv_api.model.Programa;
import com.politv.politv_api.repository.ProgramaRepository; // Asegurate de tener este repo
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/programas")
@CrossOrigin(origins = "*")
public class ProgramaController {

    @Autowired
    private ProgramaRepository programaRepository;

    @GetMapping("/{id}/detalle")
    public ResponseEntity<?> obtenerDetalle(@PathVariable Integer id) {
        // 1. Buscamos el programa en la BD
        return programaRepository.findById(id)
                .map(prog -> {
                    // 2. Simulamos lógica de horario/en vivo (Idealmente vendría de tabla Programacion)
                    boolean estaEnVivo = prog.isEnVivo(); // Asumiendo TinyInt
                    String horarioTexto = "Lunes a Viernes 19:00 hs"; // Puedes sacarlo de tu tabla 'programacion'

                    ProgramaDetalleDTO detalle = new ProgramaDetalleDTO(
                            prog.getId(),
                            prog.getNombre(),
                            prog.getDescripcion(),
                            horarioTexto,
                            estaEnVivo
                    );
                    return ResponseEntity.ok(detalle);
                })
                .orElse(ResponseEntity.notFound().build());
    }
}
