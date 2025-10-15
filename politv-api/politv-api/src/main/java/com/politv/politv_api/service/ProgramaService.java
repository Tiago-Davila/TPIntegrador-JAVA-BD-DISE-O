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
    public Suscripcion crear(int id, Suscripcion nueva) throws Exception {
        Suscripcion existente = suscripcionRepository.findById(id).orElse(null);
        if (existente != null && nueva.isActiva()) {
            throw new Exception("Ya tienes una suscripción activa");
        }
        return suscripcionRepository.save(nueva);
    }

}
