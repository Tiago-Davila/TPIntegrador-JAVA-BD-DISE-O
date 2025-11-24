package com.politv.politv_api.controller;

import com.politv.politv_api.dto.SuscripcionDTO;
import com.politv.politv_api.dto.UsuarioPerfilDTO;
import com.politv.politv_api.model.Usuario;
import com.politv.politv_api.repository.FavoritoRepository; // Importa tu repo
import com.politv.politv_api.service.UsuarioService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/usuarios")
@CrossOrigin(origins = "*") // Importante para que React pueda conectarse
public class UsuarioController {

    @Autowired
    private UsuarioService usuarioService;

    @Autowired
    private FavoritoRepository favoritoRepository;

    @GetMapping("/{id}")
    public ResponseEntity<?> obtenerUsuario(@PathVariable Integer id) {
        try {
            // 1. Obtener datos del usuario base
            Usuario usuario = usuarioService.obtenerPorId(id);
            if (usuario == null) {
                return ResponseEntity.notFound().build();
            }

            // 2. Obtener suscripciones (favoritos) desde la DB
            List<Map<String, Object>> programasRaw = favoritoRepository.findProgramasByUsuarioId(id);

            // 3. Convertir a DTOs
            List<SuscripcionDTO> suscripciones = new ArrayList<>();
            for (Map<String, Object> fila : programasRaw) {
                Integer progId = (Integer) fila.get("id");
                String nombre = (String) fila.get("nombre");
                suscripciones.add(new SuscripcionDTO(progId, nombre));
            }

            // 4. Armar respuesta final
            UsuarioPerfilDTO perfil = new UsuarioPerfilDTO(
                    usuario.getId(),
                    usuario.getNombreUsuario(),
                    usuario.getMail(),
                    usuario.getTelefono(),
                    suscripciones
            );

            return ResponseEntity.ok(perfil);

        } catch (Exception e) {
            e.printStackTrace(); // Ver error en consola de Spring
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }
}