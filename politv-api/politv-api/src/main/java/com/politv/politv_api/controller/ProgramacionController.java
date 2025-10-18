package com.politv.politv_api.controller;

import com.politv.politv_api.dto.SuscripcionDTO;
import com.politv.politv_api.model.*;
import com.politv.politv_api.repository.*;
import com.politv.politv_api.service.ProgramaService;
import com.politv.politv_api.service.PublicacionService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class ProgramacionController {

    private final ProgramacionRepository programacionRepository;
    private final ProgramaRepository programaRepository;
    private final ProgramaPorFranjaHorariaRepository programaPorFranjaHorariaRepository;
    private final PublicacionService service;
    private final ProgramaService programaService;


    public ProgramacionController(ProgramacionRepository programacionRepository, ProgramaRepository programaRepository, ProgramaPorFranjaHorariaRepository programaPorFranjaHorariaRepository, PublicacionService service, ProgramaService programaService) {
        this.programacionRepository = programacionRepository;
        this.programaRepository = programaRepository;
        this.programaPorFranjaHorariaRepository = programaPorFranjaHorariaRepository;
        this.service = service;
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


    //a
    @GetMapping("/programacion/listarPrograma")
    public List<Programacion> listarProgramaPorFecha(@RequestParam(required = true) LocalDate fecha, @RequestParam(required = true) Franja franja) {
        return programaPorFranjaHorariaRepository.findByFechaAndFranja(fecha,franja);
    }
    //b
    @PostMapping("/programa/{programaId}/suscripcionVip")
    public ResponseEntity<?> crear(@PathVariable Integer programaId, @RequestBody SuscripcionDTO request
    ) {
        try {
            return ResponseEntity.ok(programaService.crear(request.getId(), programaId, request.getSuscripcion()));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
    //c
    @GetMapping("/programas/{programaId}/blog/comentarios")
    public List<Publicacion> listarComentariosPublicos(@PathVariable Integer programaId) {
        return service.listarPublicacionesPublicas(programaId);
    }


}
