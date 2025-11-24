package com.politv.politv_api.service;



import com.politv.politv_api.model.Usuario;
import com.politv.politv_api.repository.UsuarioRepository;
import org.springframework.stereotype.Service;

@Service
public class UsuarioService {

    private final UsuarioRepository repo;

    public UsuarioService(UsuarioRepository repo) {
        this.repo = repo;
    }

    public Usuario obtenerPorId(Integer id) {
        return repo.findById(id)
                .orElseThrow(() -> new RuntimeException("Usuario no encontrado"));
    }
}

