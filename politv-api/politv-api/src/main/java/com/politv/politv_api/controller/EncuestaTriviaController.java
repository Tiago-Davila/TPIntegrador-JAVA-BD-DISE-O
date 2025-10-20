package com.politv.politv_api.controller;

import com.politv.politv_api.model.Encuesta;
import com.politv.politv_api.service.EncuestaService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/programas")
@CrossOrigin(origins = "*")
public class EncuestaTriviaController {
    private final EncuestaService encuestaService;

    public EncuestaTriviaController(EncuestaService encuestaService) {
        this.encuestaService = encuestaService;
    }

    public EncuestaService getEncuestaService() {
        return encuestaService;
    }
    @GetMapping("/{programaId}/encuestas/activas")
    public List<Encuesta> encuestasActivas(@PathVariable Integer programaId){
        return encuestaService.encuestasActivas(programaId);
    }
}
