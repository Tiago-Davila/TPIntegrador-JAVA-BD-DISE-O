package com.politv.politv_api.controller;

import com.politv.politv_api.model.*;
import com.politv.politv_api.service.PublicacionService;
import com.politv.politv_api.repository.ContenidoRepository;
import com.politv.politv_api.repository.ProgramaPorFranjaHorariaRepository;
import com.politv.politv_api.repository.ProgramacionRepository;
import com.politv.politv_api.repository.ProgramaRepository;
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

    public ProgramacionController(ProgramacionRepository programacionRepository, ProgramaRepository programaRepository, ProgramaPorFranjaHorariaRepository programaPorFranjaHorariaRepository, PublicacionService service) {
        this.programacionRepository = programacionRepository;
        this.programaRepository = programaRepository;
        this.programaPorFranjaHorariaRepository = programaPorFranjaHorariaRepository;
        this.service = service;
    }

    @GetMapping("/programacion")
    public List<Programacion> listarProgramacion() {
        return programacionRepository.findAll();
    }

    @GetMapping("/programas")
    public List<Programa> listarPrograma() {
        return programaRepository.findAll();
    }
    @GetMapping("/programacion/listarPrograma")
    public List<Programacion> listarProgramaPorFecha(@RequestParam(required = true) LocalDate fecha, @RequestParam(required = true) Franja franja) {
        return programaPorFranjaHorariaRepository.findByFechaAndFranja(fecha,franja);
    }
    @GetMapping("/programas/{programaId}/comentarios")
    public List<Publicacion> listarComentariosPublicos(@PathVariable Integer programaId) {
        return service.listarPublicacionesPublicas(programaId);
    }


}
