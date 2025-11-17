package com.politv.politv_api.service;

import com.politv.politv_api.model.Suscripcion;
import com.politv.politv_api.repository.SuscripcionRepository;
import org.springframework.stereotype.Service;

@Service
public class ProgramaService {
    private final SuscripcionRepository suscripcionRepository;

    public ProgramaService(SuscripcionRepository suscripcionRepository) {
        this.suscripcionRepository = suscripcionRepository;
    }
    public Suscripcion suscribir(Integer usuarioId, Integer programaId) {

        // evitar 2 suscripciones activas
        suscripcionRepository.findByUsuarioIdAndProgramaIdAndActiva(usuarioId, programaId, true)
                .ifPresent(s -> {
                    throw new RuntimeException("El usuario ya es VIP en este programa");
                });

        Suscripcion nueva = new Suscripcion(usuarioId, programaId);
        return suscripcionRepository.save(nueva);
    }

}
