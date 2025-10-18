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
    public Suscripcion crear(int usuarioId, int programaId, Suscripcion nueva) throws Exception {
        nueva.setProgramaId(programaId);
        Suscripcion existente = suscripcionRepository.findByUsuarioIdAndProgramaIdAndActivaTrue(usuarioId, programaId).orElse(null);
        if (existente != null) {
            throw new Exception("Ya tienes una suscripción activa");
        }
        return suscripcionRepository.save(nueva);
    }


}
