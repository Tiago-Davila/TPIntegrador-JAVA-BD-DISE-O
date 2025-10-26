package com.politv.politv_api.service;

import com.politv.politv_api.model.Encuesta;
import com.politv.politv_api.model.EstadoPublicacion;
import com.politv.politv_api.repository.EncuestasRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EncuestaService {
    private final EncuestasRepository encuestasRepository;

    public EncuestaService(EncuestasRepository encuestasRepository) {
        this.encuestasRepository = encuestasRepository;
    }

    public EncuestasRepository getEncuestasRepository() {
        return encuestasRepository;
    }
    public List<Encuesta> encuestasActivas(int programaId){
        return encuestasRepository.findByProgramaIdAndActivaTrue(programaId);
    }
}
