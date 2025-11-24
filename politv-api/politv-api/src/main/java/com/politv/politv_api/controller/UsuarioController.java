package com.politv.politv_api.controller;

import com.politv.politv_api.model.Usuario;
import com.politv.politv_api.service.UsuarioService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/usuarios")
@CrossOrigin(origins = "*")
public class UsuarioController {

    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> obtenerUsuario(@PathVariable Integer id) {
        try {
            Usuario usuario = usuarioService.obtenerPorId(id);
            return ResponseEntity.ok(usuario);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
