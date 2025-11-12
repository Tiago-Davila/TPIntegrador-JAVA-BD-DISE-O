package com.politv.politv_api.service;

import com.politv.politv_api.model.Encuesta;
import com.politv.politv_api.model.VotoEncuesta;
import com.politv.politv_api.repository.EncuestasRepository;
import com.politv.politv_api.repository.OpcionRepository;
import com.politv.politv_api.repository.VotoEncuestaRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EncuestaService {

    private final EncuestasRepository encuestaRepository;
    private final VotoEncuestaRepository votoRepository;
    private final OpcionRepository opcionRepository;

    public EncuestaService(EncuestasRepository encuestaRepository, VotoEncuestaRepository votoRepository, OpcionRepository opcionRepository) {
        this.encuestaRepository = encuestaRepository;
        this.votoRepository = votoRepository;
        this.opcionRepository = opcionRepository;
    }

    public List<Encuesta> listarActivas(Integer programaId) {
        return encuestaRepository.findByProgramaIdAndActivaTrue(programaId);
    }

    @Transactional
    public void votar(Integer encuestaId, Integer usuarioId, Integer opcionId) throws Exception {
        if (votoRepository.existsByUsuarioIdAndEncuestaId(usuarioId, encuestaId))
            throw new Exception("El usuario ya votó en esta encuesta.");

        if (!opcionRepository.existsById(opcionId))
            throw new Exception("La opción seleccionada no existe.");

        votoRepository.save(new VotoEncuesta(usuarioId, encuestaId, opcionId));
    }
}


