package com.politv.politv_api.controller;

import com.politv.politv_api.model.Favorito;
import com.politv.politv_api.service.FavoritoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios")
public class FavoritoController {

    private final FavoritoService favoritoService;

    public FavoritoController(FavoritoService favoritoService) {
        this.favoritoService = favoritoService;
    }

    @PostMapping("/{usuarioId}/favoritos/{programaId}")
    public ResponseEntity<?> agregar(@PathVariable Integer usuarioId, @PathVariable Integer programaId) {
        try {
            Favorito f = favoritoService.agregarFavorito(usuarioId, programaId);
            return ResponseEntity.ok(f);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{usuarioId}/favoritos")
    public ResponseEntity<List<Favorito>> listar(@PathVariable Integer usuarioId) {
        return ResponseEntity.ok(favoritoService.listarFavoritos(usuarioId));
    }

    @DeleteMapping("/{usuarioId}/favoritos/{programaId}")
    public ResponseEntity<?> eliminar(@PathVariable Integer usuarioId, @PathVariable Integer programaId) {
        try {
            favoritoService.eliminarFavorito(usuarioId, programaId);
            return ResponseEntity.ok("Programa eliminado de favoritos");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}

