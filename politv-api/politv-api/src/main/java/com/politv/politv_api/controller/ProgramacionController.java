package com.politv.politv_api.controller;

import com.politv.politv_api.dto.SuscripcionDTO;
import com.politv.politv_api.model.*;
import com.politv.politv_api.repository.*;
import com.politv.politv_api.service.ProgramaService;
import com.politv.politv_api.service.PublicacionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestParam;


import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class ProgramacionController {

    private final ProgramacionRepository programacionRepository;
    private final ProgramaRepository programaRepository;
    private final ProgramaPorFranjaHorariaRepository programaPorFranjaHorariaRepository;
    private final PublicacionRepository publicacionRepository;
    private final ProgramaService programaService;


    public ProgramacionController(ProgramacionRepository programacionRepository, ProgramaRepository programaRepository, ProgramaPorFranjaHorariaRepository programaPorFranjaHorariaRepository, PublicacionRepository publicacionRepository, ProgramaService programaService) {
        this.programacionRepository = programacionRepository;
        this.programaRepository = programaRepository;
        this.programaPorFranjaHorariaRepository = programaPorFranjaHorariaRepository;
        this.publicacionRepository = publicacionRepository;
        this.programaService = programaService;
    }

    @GetMapping("/programacion")
    public List<Programacion> listarProgramacion() {
        return programacionRepository.findAll();
    }

    @GetMapping("/programas")
    public List<Programa> listarPrograma() {
        return programaRepository.findAll();
    }


    //a-http://localhost:8080/api/programacion/listarPrograma?fecha=2025-10-09&franja=NOCHE
    @GetMapping("/programacion/listarPrograma")
    public List<Programacion> listarProgramaPorFecha(@RequestParam(required = true) LocalDate fecha, @RequestParam(required = true) Franja franja) {
        return programaPorFranjaHorariaRepository.findByFechaAndFranja(fecha,franja);
    }
    //b
    @PostMapping("/programa/{programaId}/suscripcionVip")
    public ResponseEntity<?> crearSuscripcion(
            @PathVariable Integer programaId,
            @RequestParam Integer usuarioId) {

        try {
            return ResponseEntity.ok(programaService.suscribir(usuarioId, programaId));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }//http://localhost:8080/api/programa/1/suscripcionVip?usuarioId=1

    @GetMapping("/publicaciones")
    public List<Publicacion> listarTodas() {
        return publicacionRepository.findAll();
    }



}
