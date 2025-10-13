package com.politv.politv_api.service;

import com.politv.politv_api.model.Franja;
import com.politv.politv_api.model.Programa;
import com.politv.politv_api.repository.ProgramacionRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;
@Service
public class ProgramacionPorFranjaHorariaService {
    private final ProgramacionRepository repository;

    public ProgramacionPorFranjaHorariaService(ProgramacionRepository repository) {
        this.repository = repository;
    }

    public ProgramacionRepository getRepository() {
        return repository;
    }

}
