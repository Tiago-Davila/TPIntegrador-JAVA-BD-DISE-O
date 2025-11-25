package com.politv.politv_api.controller;

import com.politv.politv_api.model.Publicacion;
import com.politv.politv_api.service.PublicacionService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/programas")
@CrossOrigin(origins = "*")
public class ComentarioController {
    private final PublicacionService service;

    public ComentarioController(PublicacionService service) {
        this.service = service;
    }

    public PublicacionService getService() {
        return service;
    }


    @GetMapping("/{programaId}/blog/comentarios")
    public List<Publicacion> listarPublicacionesPublicas(@PathVariable Integer programaId) {
        return service.listarPublicacionesPublicas(programaId);
    }//http://localhost:8080/api/programas/1/blog/comentarios
    @PostMapping("/{programaId}/blog/comentar")
    public Publicacion comentar(@PathVariable Integer programaId, @RequestParam Integer usuarioId   , @RequestParam String contenido) {
        return service.crearComentario(programaId, usuarioId, contenido);
    }//http://localhost:8080/api/programas/1/blog/comentar?usuarioId=1&contenido=me da asco este programa
}
