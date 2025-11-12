package com.politv.politv_api.controller;

import com.politv.politv_api.model.Notificacion;
import com.politv.politv_api.service.NotificacionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "*")
public class NotificacionController {

    @Autowired
    private NotificacionService notificacionService;

    @PostMapping("/notificaciones/recordatorios")
    public ResponseEntity<?> crear(@RequestBody Notificacion notificacion) {
        try {
            Notificacion creada = notificacionService.crearRecordatorio(notificacion);
            return ResponseEntity.ok(creada);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/usuarios/{usuarioId}/notificaciones/proximas")
    public ResponseEntity<List<Notificacion>> listar(@PathVariable int usuarioId) {
        List<Notificacion> proximas = notificacionService.listarProximas(usuarioId);
        return ResponseEntity.ok(proximas);
    }
}
