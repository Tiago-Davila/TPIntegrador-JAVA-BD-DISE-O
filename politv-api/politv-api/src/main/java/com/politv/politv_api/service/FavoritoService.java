package com.politv.politv_api.service;

import com.politv.politv_api.model.Favorito;
import com.politv.politv_api.repository.FavoritoRepository;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class FavoritoService {

    private final FavoritoRepository favoritoRepository;

    public FavoritoService(FavoritoRepository favoritoRepository) {
        this.favoritoRepository = favoritoRepository;
    }

    public Favorito agregarFavorito(Integer usuarioId, Integer programaId) throws Exception {
        if (favoritoRepository.existsByUsuarioIdAndProgramaId(usuarioId, programaId)) {
            throw new Exception("El programa ya está en favoritos.");
        }
        Favorito nuevo = new Favorito(usuarioId, programaId);
        return favoritoRepository.save(nuevo);
    }

    public List<Favorito> listarFavoritos(Integer usuarioId) {
        return favoritoRepository.findByUsuarioId(usuarioId);
    }
    @Transactional//para poder realizar un delete tiene que haber una transaccion activa
    public void eliminarFavorito(Integer usuarioId, Integer programaId) throws Exception {
        if (!favoritoRepository.existsByUsuarioIdAndProgramaId(usuarioId, programaId)) {
            throw new Exception("El programa no está en favoritos.");
        }
        favoritoRepository.deleteByUsuarioIdAndProgramaId(usuarioId, programaId);
    }
}

